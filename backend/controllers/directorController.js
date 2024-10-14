const Director = require("../models/Director");
const Country = require("../models/Countries");

exports.getAllDirector = async (req, res) => {
  try {
    const directors = await Director.findAll({
      include: [
        {
          model: Country,
          attributes: ["name"], 
        },
      ],
      logging: false,
    });
    res.status(200).json(directors);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "An error occurred" });
  }
};
