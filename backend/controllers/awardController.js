const Award = require('../models/Award');

exports.getAllAwards = async (req, res) => {
    try {
        const awards = await Award.findAll();
        res.status(200).json(awards);
      } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'An error occurred' });
      }
};
