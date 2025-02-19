const mongoose = require('mongoose')


const userScheama = mongoose.Schema({
    username:{
        type: String,
        required: true
    },
    description:{
        type: String,
        required: true
    }
})

module.exports = new mongoose.model('userModel', userScheama)