const express = require('express');
const movieController = require('../controllers/movieController');
const upload = require('../middleware/upload');
const router = express.Router();

router.post('/addMovie', upload.single('thumbnail'), movieController.createMovie);
router.get('/getAllMovies', movieController.getAllMovies);
router.get('/getByIDMovie/:id', movieController.getMovieById);
router.put('/updateMovie/:id', movieController.updateMovie);
router.delete('/deleteMovie/:id', movieController.deleteMovie);

module.exports = router;
