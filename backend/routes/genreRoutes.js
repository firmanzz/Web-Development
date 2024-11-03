const express = require('express');
const router = express.Router();
const genreController = require('../controllers/genreController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/genres', authMiddleware, genreController.getAllGenres);
router.post('/addGenres', authMiddleware, genreController.addGenre);
router.delete('/genres/:id', authMiddleware, genreController.deleteGenre);
router.put('/genres/:id', authMiddleware, genreController.editGenre);

module.exports = router;
