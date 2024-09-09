const MovieGenre = require('../models/MovieGenre');

exports.getAllMovieGenre = async (req, res) => {
  try {
    const moviegenres = await MovieGenre.findAll();
    res.status(200).json(moviegenres);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};