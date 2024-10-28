const Movie = require('../models/Movie');
const Actor = require('../models/Actor');
const Genre = require('../models/Genre');
const Availability = require('../models/Availability');
const Award = require('../models/Award');
const Director = require('../models/Director');  // Import Director
const MovieActor = require('../models/MovieActor');
const MovieGenre = require('../models/MovieGenre');
const MovieAvail = require('../models/MovieAvail');
const MovieAward = require('../models/MovieAward');
const MovieDirector = require('../models/MovieDirector');
const Comment = require('../models/Comment');
const User = require('../models/User'); 

exports.getMovieDetail = async (req, res) => {
  const { id } = req.params;

  try {
    // Find movie by ID and include actors, genres, availabilities, awards, and directors
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
          model: Availability,
          through: MovieAvail,
          attributes: ['id', 'name'],
        },
        {
          model: Award,
          through: MovieAward,
          attributes: ['id', 'award', 'year'],
        },
        {
          model: Director,  // Include directors
          through: MovieDirector,
          attributes: ['id', 'name', 'urlphoto'],  // Fetch the necessary fields
        },
        {
          model: Comment,
          where: { status: "Approved" },
          required: false,
          include: [
            {
              model: User,
              attributes: ['name'],
            },
          ],
        }
        ,
      ],
    });

    if (!movie) {
      return res.status(404).json({ message: 'Movie not found' });
    }

    res.status(200).json(movie);  // Return movie with related data
  } catch (error) {
    console.error('Error fetching movie details:', error);
    res.status(500).json({ error: 'An error occurred fetching the movie details' });
  }
};
