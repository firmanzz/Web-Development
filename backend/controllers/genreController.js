const Genre = require('../models/Genre');


exports.createGenre= async (req, res) => {
    const {name} = req.body;

    try {
        const newGenre = new Genre({
            name,
        });

        const genre = await newGenre.save();
        res.status(201).json(genre);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server Error');
    }
};

exports.getAllGenres = async (req, res) => {
    try {
        const genres = await Genre.find();
        res.status(200).json(genres);
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
};