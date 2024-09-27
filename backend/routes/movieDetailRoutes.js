// movieDetailRoutes.js
const express = require('express');
const router = express.Router();
const movieDetailController = require('../controllers/movieDetailController');

// Define the route for movie details
router.get('/movies/:id/detail', movieDetailController.getMovieDetail);

module.exports = router;
