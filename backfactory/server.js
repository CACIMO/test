const express = require('express')
const cors = require('cors')
const mongoose = require('mongoose')
const apiRoutes= require('./api')
const multer = require('multer')()
const app = express()
const conf = require('./config.json');

app.use(cors({
    origin: '*',
    credentials: true,
}));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
mongoose.connect(conf.mongoUrl,  {useNewUrlParser: true, useUnifiedTopology: true})

app.use('/',multer.single('file') , apiRoutes)
app.listen(conf.port, function () {
    console.log("server is runing");
});