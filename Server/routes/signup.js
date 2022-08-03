const express= require('express');
const User = require('../models/user');
const bcrpytjs = require('bcryptjs');
const e = require('express');
const jwt = require('jsonwebtoken');
const auth = require('../middlewares/auth');

const signupRouter = express.Router();

signupRouter.post("/api/signup",async (req,res) => {
    try {
        const {name,email,password} = req.body;
    
    const existing = await User.findOne({email});
    if(existing) {
        return res.status(400).json({msg: 'User with same email already exists!'});
    }

    const hashedPassword = await bcrpytjs.hash(password, 8);

    let user = new User({
        email,
        password: hashedPassword,
        name,
    });
    user = await user.save();
    res.json({user});
    }
    catch(e) {
        res.status(500).json({error: e.message});
    }
});

//SignIn

signupRouter.post('/api/signin',async (req,res) => {
    try {
        const {email,password} = req.body;

        const user = await User.findOne({email: email});
        if(!user) {
            return res.status(400).json({msg: "User with this email does not exist!"});
        }
        const isMatch =  await bcrpytjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg: "Incorrect password. "});
        }

        const token = jwt.sign({id: user._id}, "passwordKey");
        res.json({token,...user._doc});

    } catch(e) {
        res.status(500).json({error: e.message});
    }
});


//togetdata
signupRouter.post('/tokenIsValid',async (req,res) => {
    try {

        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
        const verified=jwt.verify(token,'passwordKey');
        if(!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if(!user) return res.json(true);

        res.json(true);
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});



//get useer data
signupRouter.get('/',auth, async (req,res) => {
    const user = await User.findById(req.user);
    res.json({...user._doc, token: req.token});
})

module.exports = signupRouter;
