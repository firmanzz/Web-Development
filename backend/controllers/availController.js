const Avail = require('../models/Availability');
const sequelize = require('../config/database');

exports.getAllavails = async (req, res) => {
  try {
    const avails = await Avail.findAll({attributes: {
      include: [
        [sequelize.literal(`(
          SELECT COUNT(*)
          FROM movie_availabilities AS ma
          WHERE ma.availid = "Availability".id
        )`), 'usageCount']
      ]
    },logging: false,});
    res.status(200).json(avails);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};

exports.addAvailability = async (req, res) => {
  const { name } = req.body;

  try {
    if (!name) {
      return res.status(400).json({ message: 'Availability name is required' });
    }
    const existingAvailability = await Avail.findOne({
      where: sequelize.where(
        sequelize.fn('LOWER', sequelize.col('name')),
        sequelize.fn('LOWER', name)
      ),
    });

    if (existingAvailability) {
      return res.status(400).json({ message: 'Availability name already exists' });
    }

    const newAvailability = await Avail.create({ name });
    res.status(201).json(newAvailability);
  } catch (error) {
    console.error("Error adding availability:", error);
    res.status(500).json({ message: 'Failed to add availability', error });
  }
};

// Edit an existing availability
exports.editAvailability = async (req, res) => {
  const { id } = req.params;
  const { name } = req.body;

  try {
    const availability = await Avail.findByPk(id);
    if (!availability) {
      return res.status(404).json({ message: 'Availability not found' });
    }
    availability.name = name;
    await availability.save();
    res.status(200).json(availability);
  } catch (error) {
    res.status(500).json({ message: 'Failed to edit availability', error });
  }
};

// Delete an availability
exports.deleteAvailability = async (req, res) => {
  const { id } = req.params;

  try {
    const availability = await Avail.findByPk(id);
    if (!availability) {
      return res.status(404).json({ message: 'Availability not found' });
    }
    await availability.destroy();
    res.status(200).json({ message: 'Availability deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Failed to delete availability', error });
  }
};