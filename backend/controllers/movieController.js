const Movie = require('../models/Movie');
const MovieGenre = require('../models/MovieGenre');
const MovieAward = require('../models/MovieAward');
const Genre = require('../models/Genre');
const Award = require('../models/Award')

exports.getAllMovies = async (req, res) => {
  try {
    const movies = await Movie.findAll({
      include: [
        {
          model: Genre,
          attributes: ['id', 'name'],
          through: { attributes: [] }, 
        },
        {
          model: Award,
          attributes: ['id', 'award'],
          through: { attributes: [] }, 
        },
      ],
      logging: false,
    });
    res.json(movies);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch movies" });
  }
};

exports.getMovieById = async (req, res) => {
  try {
    const movie = await Movie.findByPk(req.params.id);
    if (!movie) return res.status(404).json({ error: 'Movie not found' });
    res.json(movie);
  } catch (error) {
    res.status(500).json({ error: 'An error occurred' });
  }
};

exports.createMovie = async (req, res) => {
  const { genres, award, countryid, ...movieData } = req.body;

  try {
    // Buat movie baru
    const newMovie = await Movie.create({ ...movieData, countryid });

    // Tambahkan genres (many-to-many)
    if (genres && Array.isArray(genres)) {
      const genrePromises = genres.map((genreId) =>
        MovieGenre.create({ movieid: newMovie.id, genreid: genreId })
      );
      await Promise.all(genrePromises);
    }

    // Tambahkan award (many-to-many)
    if (award) {
      await MovieAward.create({ movieid: newMovie.id, awardid: award });
    }

    res.status(201).json(newMovie);
  } catch (error) {
    res.status(500).json({ error: 'Failed to create movie' });
  }
};

// Update a movie
exports.updateMovie = async (req, res) => {
  try {
    const movie = await Movie.findByPk(req.params.id);
    if (!movie) return res.status(404).json({ error: 'Movie not found' });
    
    await movie.update(req.body);
    res.json(movie);
  } catch (error) {
    res.status(500).json({ error: 'An error occurred' });
  }
};

// Delete a movie
exports.deleteMovie = async (req, res) => {
  try {
    const movie = await Movie.findByPk(req.params.id);
    if (!movie) return res.status(404).json({ error: 'Movie not found' });
    
    await movie.destroy();
    res.json({ message: 'Movie deleted' });
  } catch (error) {
    res.status(500).json({ error: 'An error occurred' });
  }
};
