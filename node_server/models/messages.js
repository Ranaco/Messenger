const mongo = require('mongoose');

const msgSchema = new mongo.Schema({
    msg:{
        type: String,
        required: true,
    }
})

const Msg = mongo.model('msg', msgSchema);

module.exports = Msg;