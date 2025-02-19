const userModel = require('../Model/model')

//CREATE
const postData = async(req,res)=>{
    const {username,description} = req.body
    try{
        const userData = new userModel({username,description})
        if(userData){
            userData.save()
            return res.status(200).send({statusCode: 200, data: userData, Message: "User Created Successfully.."})
        }
        return res.status(500).send({statusCode: 500, Message: "Internal Server Error.."})
    }catch(err){
        return res.status(404).send({statusCode: 404, data: err, Message: "Failed to create user.."})
    }
}

//READ
const getData = async(req,res)=>{
    try{
        const dataFetched = await userModel.find()
        if(dataFetched){
            return res.status(200).send({statusCode: 200, data: dataFetched, Message: "User Fetched Successfully.."})
        }
        return res.status(500).send({statusCode: 500, Message: "Internal Server Error.."})
    }catch(err){
        return res.status(404).send({statusCode: 404, data: err, Message: "Failed to fetch user.."})
    }
}

//UPDATE
const updateData = async(req,res)=>{
    const {username,description} = req.body
    try{
        const updateUser = await userModel.findByIdAndUpdate(req.params.id, {username,description}, {new: true})
        if(updateUser){
            return res.status(200).send({statusCode: 200, data: updateUser, Message: "User updated Successfully.."})
        }
        return res.status(500).send({statusCode: 500, Message: "Internal Server Error.."})
    }catch(err){
        return res.status(404).send({statusCode: 404, data: err, Message: "Failed to Update user.."})
    }
}

//DELETE
const deleteData = async(req,res)=>{
    try{
        const deleteUser = await userModel.findByIdAndDelete(req.params.id)
        if(deleteUser){
            return res.status(200).send({statusCode: 200, data: deleteUser, Message: "User deleted Successfully.."})
        }
        return res.status(500).send({statusCode: 500, Message: "Internal Server Error.."})
    }catch(err){
        return res.status(404).send({statusCode: 404, data: err, Message: "Failed to delete user.."})
    }
}

module.exports = {postData, getData, updateData, deleteData}