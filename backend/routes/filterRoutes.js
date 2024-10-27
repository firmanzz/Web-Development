const express = require('express');
const router = express.Router();
const filterController = require('../controllers/filterController');

router.get('/filters', filterController.getFilterData);

module.exports = router;
