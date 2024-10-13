// backend/routes/adminRoutes.js
const express = require('express');
const router = express.Router();
const authMiddleware = require('../middleware/authMiddleware');
const adminMiddleware = require('../middleware/adminMiddleware');
const adminController = require('../controllers/adminController');

// Semua rute di dalam '/admin' akan melalui kedua middleware ini
router.get('/', authMiddleware, adminMiddleware, adminController.getAdminPage);

module.exports = router;
