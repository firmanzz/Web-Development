const Avail = require('../models/Availability');

exports.getAllavails = async (req, res) => {
  try {
    const avails = await Avail.findAll({logging: false,});
    res.status(200).json(avails);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};