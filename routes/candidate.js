const express = require('express');
const router = express.Router();

const candidateController = require('../controllers/candidateController');

router.get('/profile/:id', candidateController.get);
router.patch('/profile', candidateController.setPublic);
router.put('/profile', candidateController.update);

module.exports = router;