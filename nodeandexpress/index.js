const express = require('express')
const app = express()
const cors = require('cors')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const PORT = 3000

const router = require("./Routers/router")

app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

const dbURL = "mongodb://localhost:27017/Dio"

mongoose.connect(dbURL).then(()=>{
  console.log("Connected to database....");
})

app.use("/", router)

app.listen(PORT, ()=>{
  console.log(`Listining to server at PORT: ${PORT}`);
})