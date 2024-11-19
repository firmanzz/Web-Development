const {Movie} = require('../models');
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
    linktrailer,
    rating,
    duration,
    status,
    countryid,
    selectedGenres,
    selectedActors,
    selectedAwards,
    selectedAvailabilities,
    selectedDirectors, // New parameter for directors
  } = req.body;

  try {
    // Buat movie baru
    const newMovie = await Movie.create({
      title,
      alternativetitle,
      synopsis,
      urlphoto,
      releasedate,
      linktrailer,
      rating,
      duration,
      status,
      countryid,
    });

    // Asosiasikan genres, actors, awards, availabilities, dan directors dengan movie baru
    if (selectedGenres && selectedGenres.length > 0) {
      const genres = await Genre.findAll({ where: { id: selectedGenres } });
      await newMovie.addGenres(genres);
    }

    if (selectedActors && selectedActors.length > 0) {
      const actors = await Actor.findAll({ where: { id: selectedActors } });
      await newMovie.addActors(actors);
    }

    if (selectedAwards && selectedAwards.length > 0) {
      const awards = await Award.findAll({ where: { id: selectedAwards } });
      await newMovie.addAwards(awards);
    }

    if (selectedAvailabilities && selectedAvailabilities.length > 0) {
      const availabilities = await Availability.findAll({ where: { id: selectedAvailabilities } });
      await newMovie.addAvailabilities(availabilities);
    }

    if (selectedDirectors && selectedDirectors.length > 0) {
      const directors = await Director.findAll({ where: { id: selectedDirectors } });
      await newMovie.addDirectors(directors); // Add directors association
    }

    res.status(201).json({ message: 'Movie created successfully!', movie: newMovie });
  } catch (error) {
    console.error("Error creating movie:", error);
    res.status(500).json({ message: 'Error creating movie', error });
  }
};

exports.updateMovie = async (req, res) => {
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
    selectedAvailabilities,
    selectedDirectors,
    removedGenres,
    removedActors,
    removedAwards,
    removedAvailabilities,
    removedDirectors,
    approvalstatus // Tambahkan approvalstatus di sini
  } = req.body;

  const { id } = req.params;

  try {
    const movie = await Movie.findByPk(id);
    if (!movie) {
      return res.status(404).json({ message: 'Movie not found' });
    }

    // Update movie details
    await movie.update({
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

    // Jika approvalstatus disediakan, perbarui
    if (typeof approvalstatus !== 'undefined') {
      movie.approvalstatus = approvalstatus;
      await movie.save(); // Pastikan perubahan disimpan
    }

    // Logika untuk mengupdate genres (add/remove selectively)
    if (selectedGenres && selectedGenres.length > 0) {
      const genresToAdd = await Genre.findAll({ where: { id: selectedGenres } });
      await movie.addGenres(genresToAdd);
    }
    if (removedGenres && removedGenres.length > 0) {
      const genresToRemove = await Genre.findAll({ where: { id: removedGenres } });
      await movie.removeGenres(genresToRemove);
    }

    // Logika untuk mengupdate actors (add/remove selectively)
    if (selectedActors && selectedActors.length > 0) {
      const actorsToAdd = await Actor.findAll({ where: { id: selectedActors } });
      await movie.addActors(actorsToAdd);
    }
    if (removedActors && removedActors.length > 0) {
      const actorsToRemove = await Actor.findAll({ where: { id: removedActors } });
      await movie.removeActors(actorsToRemove);
    }

    // Logika untuk mengupdate awards (add/remove selectively)
    if (selectedAwards && selectedAwards.length > 0) {
      const awardsToAdd = await Award.findAll({ where: { id: selectedAwards } });
      await movie.addAwards(awardsToAdd);
    }
    if (removedAwards && removedAwards.length > 0) {
      const awardsToRemove = await Award.findAll({ where: { id: removedAwards } });
      await movie.removeAwards(awardsToRemove);
    }

    // Logika untuk mengupdate availabilities (add/remove selectively)
    if (selectedAvailabilities && selectedAvailabilities.length > 0) {
      const availabilitiesToAdd = await Availability.findAll({ where: { id: selectedAvailabilities } });
      await movie.addAvailabilities(availabilitiesToAdd);
    }
    if (removedAvailabilities && removedAvailabilities.length > 0) {
      const availabilitiesToRemove = await Availability.findAll({ where: { id: removedAvailabilities } });
      await movie.removeAvailabilities(availabilitiesToRemove);
    }

    // Logika untuk mengupdate directors (add/remove selectively)
    if (selectedDirectors && selectedDirectors.length > 0) {
      const directorsToAdd = await Director.findAll({ where: { id: selectedDirectors } });
      await movie.addDirectors(directorsToAdd); // Add new directors
    }
    if (removedDirectors && removedDirectors.length > 0) {
      const directorsToRemove = await Director.findAll({ where: { id: removedDirectors } });
      await movie.removeDirectors(directorsToRemove); // Remove selected directors
    }

    res.status(200).json({ message: 'Movie updated successfully!', movie });
  } catch (error) {
    console.error("Error updating movie:", error);
    res.status(500).json({ message: 'Error updating movie', error });
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

