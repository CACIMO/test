const { ObjectId, ObjectID } = require('bson');
let mongoose = require('mongoose');
mongoose.pluralize(null);

let factorySchema = mongoose.Schema({
    razonsocial: {
        type: String,
        required: true
    },
    nit: {
        type: Number,
        required: true
    },
    direccion: {
        type: String,
        required: true
    },
    telefono: {
        type: Number,
        required: true
    },
    descripcion: {
        type: String,
        required: true
    },
    logo: {
        type: String,
        required: true
    }
});

let userSchema = mongoose.Schema({
    user:{
        type:String,
        required:true

    },
    pwd:{
        type:String,
        required:true
    }
})