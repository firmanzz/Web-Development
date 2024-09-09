const express = require('express');
const router = express.Router();
const moviegenreController = require('../controllers/movieGenreController');

router.get('/moviegenres', moviegenreController.getAllMovieGenre);

module.exports = router;
