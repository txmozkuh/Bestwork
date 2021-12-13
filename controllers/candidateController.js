const candidateModel = require('../Model/Candidate');

class candidateController{
    // [POST] /register
    async update(req, res) {
        await candidateModel.updateProfile(req, res);
        res.send({message: 'Update successfully !!!'});
    }

    async setPublic(req, res) {
        await candidateModel.setPublic(req, res);
        res.send({message: 'Set Public CV successfully !!!'});
    }

    async get(req, res) {
        const candidate = await candidateModel.getProfile(req, res);
        res.send({message: 'GET successfully !!!', candidate});
    }
}

module.exports = new candidateController();