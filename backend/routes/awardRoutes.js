const express = require('express');
const router = express.Router();
const awardController = require('../controllers/awardController');

router.get('/awards', awardController.getAllAwards);

router.post('/awards', awardController.createAward);

router.post('/awards/edit/:id', awardController.editAward);

router.post('/awards/delete/:id', awardController.deleteAward);

module.exports = router;
