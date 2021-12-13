const candidateModel = require('../Model/Candidate');

class candidateController{
    // [GET] /profile/:id
    async update(req, res) {
        await candidateModel.updateProfile(req, res);
        res.send({message: 'Update successfully !!!'});
    }

    //[PATCH] /profile
    async setPublic(req, res) {
        await candidateModel.setPublic(req, res);
        res.send({message: 'Set Public CV successfully !!!'});
    }

    // [PUT] /profile
    async get(req, res) {
        const candidate = await candidateModel.getProfile(req, res);
        res.send({message: 'GET successfully !!!', candidate});
    }
}

module.exports = new candidateController();