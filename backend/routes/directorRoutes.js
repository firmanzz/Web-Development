const express = require('express');
const router = express.Router();
const directorController = require('../controllers/directorController');

router.get('/directors', directorController.getAllDirector);

module.exports = router;
