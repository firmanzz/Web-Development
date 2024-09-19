const Movie = require('../models/Movie');
const MovieGenre = require('../models/MovieGenre');
const MovieAward = require('../models/MovieAward');
const Genre = require('../models/Genre');
const Award = require('../models/Award');
const Actor = require('../models/Actor');

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

exports.addMovie = async (req, res) => {
  const {
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
    countryid,
    selectedGenres,
    selectedActors,
    selectedAwards,
  } = req.body;

  try {
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
      countryid,
    });

    // Add genres to the movie (many-to-many)
    if (selectedGenres && selectedGenres.length > 0) {
      const genres = await Genre.findAll({
        where: { id: selectedGenres.map((genre) => genre.id) },
      });
      await newMovie.addGenres(genres);
    }

    // Add actors to the movie (many-to-many)
    if (selectedActors && selectedActors.length > 0) {
      const actors = await Actor.findAll({
        where: { id: selectedActors.map((actor) => actor.id) },
      });
      await newMovie.addActors(actors);
    }

    // Add awards to the movie (many-to-many)
    if (selectedAwards && selectedAwards.length > 0) {
      const awards = await Award.findAll({
        where: { id: selectedAwards.map((award) => award.id) },
      });
      await newMovie.addAwards(awards);
    }

    res.status(201).json({ message: 'Movie created successfully!', movie: newMovie });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error creating movie', error });
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

exports.deleteMovie = async (req, res) => {
  const { id } = req.params;
  try {
    const movie = await Movie.findByPk(id);
    if (!movie) {
      return res.status(404).json({ message: "Movie not found" });
    }
    await movie.destroy();
    res.status(200).json({ message: "Movie deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: "Error deleting movie", error });
  }
};

