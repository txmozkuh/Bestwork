const recruiterModel = require('../Model/Recruiter');

class recruiterController{
    //-------------------------- Profile --------------------------------\\

    // [GET] /profile
    async get(req, res) {
        const recruiter = await recruiterModel.getProfile(req, res);
        res.send({message: 'GET successfully !!!', recruiter});
    }

    // [GET] /profile/:id
    async update(req, res) {
        await recruiterModel.updateProfile(req, res);
        res.send({message: 'Update successfully !!!'});
    }

    //-------------------------- Job Action --------------------------------\\

    // [POST] /job-create
    async createJob(req, res) {
        await recruiterModel.createJob(req, res);
        res.send({message: 'POST job successfully !!!'});
    }

    // [GET] /job-description/:jobId
    async getJobDescription(req, res) {
        const job = await recruiterModel.getJobDescription(req, res);
        res.send({message: 'GET job description successfully !!!', job});
    }

    // [GET] /job-list
    async getCreatedJob(req, res) {
        const jobList = await recruiterModel.getCreatedJob(req, res);
        res.send({message: 'GET job list successfully !!!', jobList});
    }

    // [PUT] /job-description/:jobId
    async editJobDescription(req, res) {
        await recruiterModel.updateJob(req, res);
        res.send({message: 'PUT update job description successfully !!!'});
    }

    //-------------------------- Candidate of a Job --------------------------------\\

    // [GET] /applied-list/:jobId
    async getAppliedList(req, res) {
        const recruiter = await recruiterModel.postJob(req, res);
        res.send({message: 'GET applied list successfully !!!', recruiter});
    }

    // [GET] /candidate-profile/:candidateId
    async getCandidateProfile(req, res) {
        const recruiter = await recruiterModel.postJob(req, res);
        res.send({message: 'GET candidate profile successfully !!!', recruiter});
    }

    //---------------------------------- StarCV ----------------------------------------\\

    // [GET] /star-cv
    async getStarCV(req, res) {
        const recruiter = await recruiterModel.postJob(req, res);
        res.send({message: 'GET candidate profile successfully !!!', recruiter});
    }

}

module.exports = new recruiterController();