const express = require('express');
const app = express();
const http = require('http');
const cors = require('cors');
const server = http.createServer(app);
const io = require('socket.io')(server,{cors: {origin: '*'}});
const mongo = require('mongoose');
const mongoDbKey = "mongodb+srv://AsTaR_aNjE:messengerclone@cluster0.4oztt.mongodb.net/messenger_clone?retryWrites=true&w=majority";
const Msg = require("./models/messages.js");
mongo.connect(mongoDbKey, {useNewUrlParser: true, useUnifiedTopology: true,}).then(() => {
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
    console.log(`Server is running on port`, PORT);
})
