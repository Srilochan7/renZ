const UserService = require("../services/user.services");

exports.register = async(req, res, next)=>{
    try{
        const {email,password,username} = req.body;

        await UserService.registerUser(email, password, username);

        res.json({staus:true, sucess:"User Registered Sucessfully"});
    }   
    
    catch(err){
        res.status(500).json({status: false, error: err.message});
    }
}

exports.login = async(req, res, next)=>{
    try{
        const {email, password} = req.body;
        await UserService.loginUser(email, password);
        res.json({status:true, sucess:"Logged In"});
    }
    catch(err){
        throw err;
    }
}