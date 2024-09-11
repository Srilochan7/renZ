const mongoose = require('mongoose');
const db = require('../config/db');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;

const UserSchema = new Schema({
    email:{
        type:String,
        lowercase:true,
        required:true,
        unique:true,
    },
    password:{
        type:String,
        required:true
    },
    username:{
        type:String,
        required:true,
        unique:true
    },
    phno:{
        type:Number,
        required:false,
        default:910000000,
    },
    address:{
        type:String,
        required:false,
        default:''
    }
});

UserSchema.pre('save', async function (next) {
    try {
        var user = this;
        const salt = await bcrypt.genSalt(10);
        const hashpass = await bcrypt.hash(user.password, salt);
        user.password = hashpass;
    } catch (err) {
        throw err;
    }
});

const UserModel = mongoose.model('user', UserSchema);
module.exports = UserModel;
