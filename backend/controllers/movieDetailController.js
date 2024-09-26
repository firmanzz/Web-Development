const Movie = require('../models/Movie');
const Actor = require('../models/Actor');
const Genre = require('../models/Genre');
const Availability = require('../models/Availability');  // Ensure Availability is imported
const MovieActor = require('../models/MovieActor');
const MovieGenre = require('../models/MovieGenre');
const MovieAvail = require('../models/MovieAvail');

exports.getMovieDetail = async (req, res) => {
  const { id } = req.params;

  try {
    // Find movie by ID and include related actors, genres, and availabilities
    const movie = await Movie.findByPk(id, {
      include: [
        {
          model: Actor,
          through: MovieActor,
          attributes: ['id', 'name', 'urlphoto'],
        },
        {
          model: Genre,
          through: MovieGenre,
          attributes: ['id', 'name'],
        },
        {
          model: Availability,  // Include availabilities
          through: MovieAvail,  // Many-to-many relation through MovieAvail
          attributes: ['id', 'name'],  // Fetch only these availability fields
        }
      ]
    });

    if (!movie) {
      return res.status(404).json({ message: 'Movie not found' });
    }

    res.status(200).json(movie);  // Send the movie along with actors, genres, and availabilities
  } catch (error) {
    console.error('Error fetching movie details:', error);
    res.status(500).json({ error: 'An error occurred fetching the movie details' });
  }
};
