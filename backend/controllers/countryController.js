const Country = require('../models/Countries');
const sequelize = require('../config/database');

exports.getAllCountry = async (req, res) => {
  try {
    const countries = await Country.findAll({attributes: {
      include: [
        [sequelize.literal(`(
          SELECT COUNT(*)
          FROM movies AS m
          WHERE m.countryid = "Country".id
        )`), 'movieCount']
      ]
    },
    raw: true,order: [['name', 'ASC']], logging: false,});
    res.status(200).json(countries);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};

exports.addCountry = async (req, res) => {
  try {
    const { name } = req.body;

    if (!name) {
      return res.status(400).json({ error: 'Country name is required' });
    }

    // Validasi duplikasi nama negara (case-insensitive)
    const existingCountry = await Country.findOne({
      where: sequelize.where(
        sequelize.fn('lower', sequelize.col('name')), 
        sequelize.fn('lower', name)
      ),
    });

    if (existingCountry) {
      return res.status(400).json({ error: 'Country name already exists' });
    }

    // Jika tidak ada duplikasi, buat country baru
    const newCountry = await Country.create({ name });
    res.status(201).json(newCountry);
  } catch (error) {
    console.error("Error adding country:", error);
    res.status(500).json({ error: 'An error occurred while adding the country' });
  }
};


exports.deleteCountry = async (req, res) => {
  const { id } = req.params;
  try {
    const country = await Country.findByPk(id);
    if (!country) {
      return res.status(404).json({ message: "Country not found" });
    }
    await country.destroy();
    res.status(200).json();
  } catch (error) {
    res.status(500).json({ message: "Error deleting country", error });
  }
};

exports.editCountry = async (req, res) => {
  const { id } = req.params;
  const { name } = req.body;

  try {
    const country = await Country.findByPk(id);

    if (!country) {
      return res.status(404).json({ error: "Country not found" });
    }

    if (!name) {
      return res.status(400).json({ error: "Country name is required" });
    }

    country.name = name;
    await country.save();

    res.status(200).json(country);
  } catch (error) {
    console.error("Error updating country:", error);
    res.status(500).json({ error: "An error occurred while updating the country" });
  }
};