const express = require('express')
const { postData, getData, updateData, deleteData } = require('../Controller/controller')
const Router = express.Router()

Router.post("/post-api", postData)
Router.get("/get-api", getData)
Router.put("/update-api/:id", updateData)
Router.delete("/delete-api/:id", deleteData)

module.exports = Router;