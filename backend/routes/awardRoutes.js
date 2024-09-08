const express = require('express');
const router = express.Router();
const awardController = require('../controllers/awardController');

router.get('/awards', awardController.getAllAwards);

module.exports = router;
