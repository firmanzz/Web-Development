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

const { Movie, Genre, MovieGenre, Award, MovieAward, Actor, MovieActor } = require('../models');

exports.addMovie = async (req, res) => {
  try {
    const { title, alternativetitle, synopsis, urlphoto, releasedate, availability, linktrailer, rating, duration, status, approvalstatus, countryid, genres, awards, actors } = req.body;

    // Validasi jika title atau countryid kosong
    if (!title || !countryid) {
      return res.status(400).json({ error: 'Movie title and country are required' });
    }

    // Buat movie baru
    const newMovie = await Movie.create({
      title,
      alternativetitle,
      synopsis,
      urlphoto,
      releasedate,
      availability,
      linktrailer,
      rating,
      duration,
      status,
      approvalstatus,
      countryid,
    });

    // Tambahkan genres ke movie
    if (genres && genres.length > 0) {
      await Promise.all(
        genres.map(async (genreId) => {
          await MovieGenre.create({
            movieid: newMovie.id,
            genreid: genreId,
          });
        })
      );
    }

    // Tambahkan awards ke movie
    if (awards && awards.length > 0) {
      await Promise.all(
        awards.map(async (awardId) => {
          await MovieAward.create({
            movieid: newMovie.id,
            awardid: awardId,
          });
        })
      );
    }

    // Tambahkan actors ke movie
    if (actors && actors.length > 0) {
      await Promise.all(
        actors.map(async (actorId) => {
          await MovieActor.create({
            movieid: newMovie.id,
            actorid: actorId,
          });
        })
      );
    }

    res.status(201).json(newMovie);
  } catch (error) {
    console.error("Error adding movie:", error);
    res.status(500).json({ error: 'An error occurred while adding the movie' });
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
