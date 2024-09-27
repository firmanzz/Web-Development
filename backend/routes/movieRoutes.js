const express = require('express');
const router = express.Router();
const movieController = require('../controllers/movieController');

router.get('/movies', movieController.getAllMovies);
router.get('/movies/top', movieController.getTopRatedMovies);
router.get('/movies/:id', movieController.getMovieById);
router.post('/addMovie', movieController.addMovie);
router.put('/movies/:id', movieController.updateMovie);
router.delete('/movies/:id', movieController.deleteMovie);

module.exports = router;
