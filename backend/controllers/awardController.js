const Award = require('../models/Award');
const Country = require("../models/Countries");

exports.getAllAwards = async (req, res) => {
  try {
    const awards = await Award.findAll({
      include: [
        {
          model: Country,
          attributes: ["name"], 
        },
      ],
      logging: false,
    });
    res.status(200).json(awards);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};