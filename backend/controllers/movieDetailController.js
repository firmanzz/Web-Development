const Movie = require('../models/Movie');
const Actor = require('../models/Actor');
const MovieActor = require('../models/MovieActor'); // Ensure MovieActor is imported

exports.getMovieDetail = async (req, res) => {
  const { id } = req.params;

  try {
    // Find movie by ID and include related actors
    const movie = await Movie.findByPk(id, {
      include: [
        {
          model: Actor,  // Include actors
          through: MovieActor,  // Many-to-many relation through MovieActor table
          attributes: ['id', 'name', 'urlphoto'],  // Fetch only these actor fields
        },
        // Add other relations like genres, awards if necessary
      ]
    });

    if (!movie) {
      return res.status(404).json({ message: 'Movie not found' });
    }

    res.status(200).json(movie);  // Send the movie along with actors
  } catch (error) {
    console.error('Error fetching movie details:', error);
    res.status(500).json({ error: 'An error occurred fetching the movie details' });
  }
};
