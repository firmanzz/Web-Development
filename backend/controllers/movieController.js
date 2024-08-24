const Movie = require('../models/Movie');


exports.createMovie= async (req, res) => {
    const {title, description, genres, releaseYear, rating, duration, actors, directors, country} = req.body;
    const thumbnail = req.file ? req .file.path : undefined;

    if (!thumbnail) {
        return res.status(400).json({msg: 'Thumbnail is required'});
    }

    try {
        const newMovie = new Movie({
            title,
            description,
            genres,
            releaseYear,
            rating,
            duration,
            actors,
            directors,
            country,
            thumbnail,
        });

        const film = await newMovie.save();
        res.status(201).json(film);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server Error');
    }
};

exports.getAllMovies = async (req, res) => {
    try {
        const movies = await Movie.find();
        res.status(200).json(movies);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

exports.getMovieById = async (req, res) => {
    try {
        const movie = await Movie.findById(req.params.id);
        if (!movie) {
            return res.status(404).json({ message: 'Movie not found' });
        }
        res.status(200).json(movie);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

exports.updateMovie = async (req, res) => {
    try {
        const updatedMovie = await Movie.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!updatedMovie) {
            return res.status(404).json({ message: 'Movie not found' });
        }
        res.status(200).json(updatedMovie);
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
};

exports.deleteMovie = async (req, res) => {
    try {
        const deletedMovie = await Movie.findByIdAndDelete(req.params.id);
        if (!deletedMovie) {
            return res.status(404).json({ message: 'Movie not found' });
        }
        res.status(200).json({ message: 'Movie deleted successfully' });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};

exports.getAllYears = async (req, res) => {
    try {
        const years = await Movie.distinct('releaseYear');
        res.status(200).json(years);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};