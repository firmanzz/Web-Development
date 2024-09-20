const express = require('express');
const router = express.Router();
const genreController = require('../controllers/genreController');

router.get('/genres', genreController.getAllGenres);
router.post('/addGenres', genreController.addGenre);
router.delete('/genres/:id', genreController.deleteGenre);

module.exports = router;
