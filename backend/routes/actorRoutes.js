const express = require('express');
const router = express.Router();
const actorController = require('../controllers/actorController');
const authMiddleware = require('../middleware/authMiddleware'); // Import authMiddleware

router.get('/actors', authMiddleware, actorController.getAllActor);
router.post('/addActor', authMiddleware, actorController.addActor);
router.delete('/actors/:id', authMiddleware, actorController.deleteActor);
router.put('/actors/:id', authMiddleware, actorController.editActor);

module.exports = router;
