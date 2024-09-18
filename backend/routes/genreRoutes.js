const express = require('express');
const router = express.Router();
const genreController = require('../controllers/genreController');

router.get('/genres', genreController.getAllGenres);
router.post('/addgenres', genreController.addGenre);

module.exports = router;
