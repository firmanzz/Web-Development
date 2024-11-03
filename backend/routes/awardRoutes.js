const express = require('express');
const router = express.Router();
const awardController = require('../controllers/awardController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/awards', authMiddleware, awardController.getAllAwards);
router.post('/addAward', authMiddleware, awardController.addAward);
router.delete('/awards/:id', authMiddleware, awardController.deleteAward);
router.put('/awards/:id', authMiddleware, awardController.editAward);

module.exports = router;
