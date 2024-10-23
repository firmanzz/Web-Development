const express = require('express');
const router = express.Router();
const actorController = require('../controllers/actorController');

router.get('/actors', actorController.getAllActor);
router.post('/addActor', actorController.addActor);
router.delete('/actors/:id', actorController.deleteActor);
router.put('/actors/:id', actorController.editActor);
module.exports = router;
