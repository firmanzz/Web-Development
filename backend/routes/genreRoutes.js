const express = require('express');
const genreController = require('../controllers/genreController');
const router = express.Router();

router.post('/addGenre', genreController.createGenre);
router.get('/getAllGenres', genreController.getAllGenres);

module.exports = router;
