const Movie = require('../models/Movie');
const Country = require('../models/Countries');
const Genre = require('../models/Genre');
const Award = require('../models/Award');
const Actor = require('../models/Actor');
const Director = require('../models/Director');
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
        {
          model: Director,
          attributes: ['id', 'name'],
          through: { attributes: [] },
        },
        {
          model: Country,  // Include country data
          attributes: ['id', 'name'],
        },
      ],
      order: [['releasedate', 'DESC']],
      logging: false,
    });
    res.json(movies);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch movies" });
  }
};


exports.getMovieById = async (req, res) => {
  try {
    const movie = await Movie.findByPk(req.params.id,{
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
        {
          model: Director,
          attributes: ['id', 'name'],
          through: { attributes: [] }, 
        },
      ],
      logging: false,
    });
    if (!movie) return res.status(404).json({ error: 'Movie not found' });
    res.json(movie);
  } catch (error) {
    res.status(500).json({ error: 'An error occurred' });
  }
};

exports.getTopRatedMovies = async (req, res) => {
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
        {
          model: Director,
          attributes: ['id', 'name'],
          through: { attributes: [] }, 
        },
      ],
      order: [['rating', 'DESC']], 
      limit: 12,
      logging: false,
    });
    res.json(movies);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch movies" });
  }
};

exports.getNewestMovies = async (req, res) => {
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
        {
          model: Director,
          attributes: ['id', 'name'],
          through: { attributes: [] }, 
        },
      ],
      order: [['releasedate', 'DESC']], 
      limit: 12,
      logging: false,
    });
    res.json(movies);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch movies" });
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

    if (selectedAvailabilities && selectedAvailabilities.length > 0) {
      const availabilities = await Availability.findAll({
        where: { id: selectedAvailabilities.map((avail) => avail.id) },
      });
      await newMovie.addAvailabilities(availabilities);  // Tambahkan availabilities
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
    const { title, synopsis, genres, actors, availabilities, awards, approvalstatus } = req.body;

    // Cari movie berdasarkan ID
    const movie = await Movie.findByPk(id);
    if (!movie) {
      return res.status(404).json({ error: "Movie not found" });
    }

    // Perbarui field hanya jika ada di request body, jika tidak gunakan nilai yang sudah ada
    if (title !== undefined) movie.title = title;
    if (synopsis !== undefined) movie.synopsis = synopsis;
    
    // Pastikan approvalstatus yang diterima adalah boolean, simpan sebagai true/false
    if (approvalstatus !== undefined) {
      movie.approvalstatus = Boolean(approvalstatus);
    }

    if (genres) {
      await movie.setGenres(genres);  // setGenres adalah helper Sequelize untuk relasi many-to-many
    }
    if (actors) {
      await movie.setActors(actors);  // setActors adalah helper Sequelize untuk relasi many-to-many
    }
    if (awards) {
      await movie.setAwards(awards);  // setAwards adalah helper Sequelize untuk relasi many-to-many
    }
    if (availabilities) {
      await movie.setaw(awards);  // setAwards adalah helper Sequelize untuk relasi many-to-many
    }

    // Simpan perubahan pada movie
    await movie.save();

    // Mengirim kembali data movie yang diperbarui
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

