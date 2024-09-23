const Movie = require('../models/Movie');
const availability = require('../models/Availability');
const Genre = require('../models/Genre');
const Award = require('../models/Award');
const Actor = require('../models/Actor');
const Availability = require('../models/Availability');

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
          model: Actor,
          attributes: ['id', 'name'],
          through: { attributes: [] }, 
        },
        {
          model: Award,
          attributes: ['id', 'award'],
          through: { attributes: [] }, 
        },
        {
          model: Availability,
          attributes: ['id', 'name'],
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


exports.updateMovie = async (req, res) => {
  try {
    const { id } = req.params;
    const { title, synopsis, genres, actors, awards, approvalstatus } = req.body;

    const movie = await Movie.findByPk(id);
    if (!movie) {
      return res.status(404).json({ error: "Movie not found" });
    }

    // Update basic movie fields
    movie.title = title;
    movie.synopsis = synopsis;
    movie.approvalstatus = approvalstatus === true || approvalstatus === "true";  // Ensure boolean

    // Update relationships (genres, actors, awards) as needed
    if (genres) {
      await movie.setGenres(genres);  // Assuming setGenres is a method for many-to-many relationship
    }
    if (actors) {
      await movie.setActors(actors);  // Assuming setActors is a method for many-to-many relationship
    }
    if (awards) {
      await movie.setAwards(awards);  // Assuming setAwards is a method for many-to-many relationship
    }

    await movie.save();
    res.status(200).json(movie);
  } catch (error) {
    console.error("Error updating movie:", error);
    res.status(500).json({ error: "An error occurred while updating the movie" });
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

