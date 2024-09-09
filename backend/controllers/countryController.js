const Country = require('../models/Countries');

exports.getAllCountry = async (req, res) => {
  try {
    const countries = await Country.findAll({logging: false,});
    res.status(200).json(countries);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};