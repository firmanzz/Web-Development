const express = require('express');
const router = express.Router();
const directorController = require('../controllers/directorController');

router.get('/directors', directorController.getAllDirector);
router.post('/addDirector', directorController.addDirector);
router.delete('/directors/:id', directorController.deleteDirector);
router.put('/directors/:id', directorController.editDirector);
module.exports = router;
