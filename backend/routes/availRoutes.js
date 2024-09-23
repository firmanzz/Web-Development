const express = require('express');
const router = express.Router();
const availController = require('../controllers/availController');

router.get('/avail', availController.getAllavails);

module.exports = router;
