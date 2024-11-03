const express = require('express');
const router = express.Router();
const filterController = require('../controllers/filterController');
const authMiddleware = require('../middleware/authMiddleware'); // Import authMiddleware

router.get('/filters', authMiddleware, filterController.getFilterData);

module.exports = router;
