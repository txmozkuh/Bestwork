const getModel = require('../Model/Get');

class getController{
    // [POST] /register
    async interest(req, res) {
        const interests = await getModel.getInterest(req, res);
        res.send({message: 'GET interest table successfully !!!', interests});
    }

    async skill(req, res) {
        const skills = await getModel.getSkill(req, res);
        res.send({message: 'GET skill table successfully !!!', skills});
    }

    async job(req, res) {
        const jobs = await getModel.getJob(req, res);
        res.send({message: 'GET job table successfully !!!', jobs});
    }
}

module.exports = new getController();