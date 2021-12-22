const express = require('express');
const router = express.Router();


const candidateController = require('../controllers/candidateController');

router.get('/profile', candidateController.get);
router.patch('/profile', candidateController.setPublic);
router.put('/profile', candidateController.update);

router.post('/apply', candidateController.apply);
router.get('/job-applied', candidateController.appliedList);
router.get('/job-list', candidateController.jobList);
router.get('/job-description/:jobId', candidateController.jobDescription);

module.exports = router;