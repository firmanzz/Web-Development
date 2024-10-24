const express = require('express');
const router = express.Router();
const awardController = require('../controllers/awardController');

router.get('/awards', awardController.getAllAwards);
router.post('/addAward', awardController.addAward);
router.delete('/awards/:id', awardController.deleteAward);
router.put('/awards/:id', awardController.editAward);
module.exports = router;
