const express = require('express');
const router = express.Router();
const movieController = require('../controllers/movieController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/movies', authMiddleware, movieController.getAllMovies);
router.get('/movies/top', authMiddleware, movieController.getTopRatedMovies);
router.get('/movies/new', authMiddleware, movieController.getNewestMovies);
router.get('/movies/:id', authMiddleware, movieController.getMovieById);
router.post('/addMovie', authMiddleware, movieController.addMovie);
router.put('/movies/:id', authMiddleware, movieController.updateMovie);
router.delete('/movies/:id', authMiddleware, movieController.deleteMovie);

module.exports = router;
