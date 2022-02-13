const express = require('express');
const app = express();
const http = require('http');
const cors = require('cors');
const path = require('path');
const fs = require('fs');
const fsPromises = require('fs').promises;
const key = require('./constants')

const server = http.createServer((req, res) => {
        console.log(req.url, req.method);

        const extension = path.extname(req.url);

        const serveFile = async (fileName, contentType, response) => {
           try{
            const file = await fsPromises.readFile(fileName, !contentType.includes('images') ? "utf8" : "");
            response.writeHead(200, {'Content-Type': contentType});
            response.end(file);
           }catch(err){
               console.log(err);
           }
        }

        let contentType;

        switch(extension){
            case ".css":
                contentType = "text/css";
                break;
            case ".html":
                contentType = "text/html";
                break;
            case ".jpg":
                contentType = "image/jpg";
                break;
            case ".png":
                contentType = "image/png";
                break;
            case ".json":
                contentType = "application/json";
                break;
            case ".txt":
                contentType = "text/plain";
                break;
            default:
                contentType = "text/html";
        }

        let filePath = contentType === "text/html" && req.url === "/" ?
                            path.join(__dirname,"views", 'index.html'): 
                                contentType === "text/html" && req.url.slice(-1) === "/" ?
                                    path.join(__dirname,"views", req.url, 'index.html'):
                                        contentType === "text/html" ?
                                            path.join(__dirname, 'views', req.url):
                                                path.join(__dirname, req.url);

                        console.log(contentType, filePath);

        if(!extension && req.url.slice(-1) !== "/") filePath +=".html";
        const fileExists = fs.existsSync(__dirname, filePath);
        
        if(fileExists){
                serveFile(path.join(filePath), contentType, res);
        } else {
            res.writeHead(404, {'Content-Type': 'text/html'});
            res.end('<h1>404 Not Found</h1>');
        }

})

const io = require('socket.io')(server,{cors: {origin: '*'}});
const mongo = require('mongoose');
const Msg = require("./models/messages.js");
mongo.connect(key, {useNewUrlParser: true, useUnifiedTopology: true,}).then(() => {
    console.log('mongodb connected');
}).catch((err) => {
    console.log(err);
}) 

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({extended: true}));

let users = [];

io.on('connection', (client) => {
    console.log(`Client connected: `, client.id);

    io.to(client.id).emit("hello", "Hello from server");
    client.join('room1');

    users.push(client.id);

    client.on('print', () => {
        console.log(client.id);
    })

    client.on('start', (data) => {
        users.push(data);
        console.log(users[0]);
        users[0]['socket_id'] = client.id;
    })

    io.to('room1').emit('users',   `Total users joined: ${[...users]}`);

    client.on('msg', (data) => {
        console.log(data);
        const mess = data['msg'];
        const message = new Msg({msg: mess});
        message.save().then(() => {
            io.to(users.filter(user => user !== client.id)).emit('msg', data);
        })
    });
    
    client.on('disconnect', () => {
        console.log(`Client disconnected: `, client.id);
        users = users.filter(user => user !== client.id);
        console.log(`Clients remaining ${[...users]}`);
        io.emit('dis',  `User offline : `, client.id);
    });
})



const PORT = process.env.PORT || 3500;

server.listen(PORT, () => {
    console.log("listening on port", PORT);
})

// server.listen(PORT, () => {
//     console.log(`Server is running on port`, PORT);
// })
