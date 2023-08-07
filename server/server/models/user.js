const mongoose = require("mongoose");
const userSchema = mongoose.Schema({
    name: {
        require: true,
        type: String, 
        trim: true,   
    },
    email: {
        required: true,
        type: String,
        trime: true,
        validate: {
            validator: (value)=>{
                const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re); 
            },
            message: "Please Enter A Valid Email Address",
        },
    },
    password: {
        required: true,
        type: String,
        validate: {
            validator: (value)=>{
                return value.length>6;
            },
            message: "Please Enter A Long Password",
        },
    },
    address: {
        type: String,
        default: ""
    },
    type:{
        type: String,
        default: "user",
    },
    //cart
//pending    
});

const User = mongoose.model("User", userSchema);
module.exports = User;