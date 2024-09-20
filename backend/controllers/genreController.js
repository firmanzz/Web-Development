const Genre = require('../models/Genre');

exports.getAllGenres = async (req, res) => {
  try {
    const genres = await Genre.findAll({logging: false,});
    res.status(200).json(genres);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};

exports.addGenre = async (req, res) => {
  try {
    const { name } = req.body;

    if (!name) {
      return res.status(400).json({ error: 'Genre name is required' });
    }

    console.log("Request body:", req.body); 

    const newGenre = await Genre.create({ name });
    res.status(201).json(newGenre); 
  } catch (error) {
    console.error("Error adding genre:", error);
    res.status(500).json({ error: 'An error occurred while adding the genre' });
  }
};

exports.deleteGenre = async (req, res) => {
  const { id } = req.params;
  try {
    const genre = await Genre.findByPk(id);
    if (!genre) {
      return res.status(404).json({ message: "Genre not found" });
    }
    await genre.destroy();
    res.status(200).json({ message: "Genre deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: "Error deleting genre", error });
  }
};