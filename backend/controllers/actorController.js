const Actor = require('../models/Actor');

exports.getAllActor = async (req, res) => {
  try {
    const actors = await Actor.findAll({logging: false,});
    res.status(200).json(actors);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};