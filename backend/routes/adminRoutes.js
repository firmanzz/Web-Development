const express = require('express');
const router = express.Router();
const movieController = require('../controllers/movieController');
const adminMiddleware = require('../middleware/adminMiddleware');
const authMiddleware = require('../middleware/authMiddleware');

// Route for adding movie accessible by editor
router.post('/addMovie', authMiddleware, adminMiddleware, movieController.addMovie);

// Other admin routes
router.get('/', authMiddleware, adminMiddleware, (req, res) => {
  res.send('Admin dashboard');
});

module.exports = router;
