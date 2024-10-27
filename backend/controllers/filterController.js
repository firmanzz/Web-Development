const Genre = require("../models/Genre");
const Movie = require("../models/Movie");
const Availability = require("../models/Availability");
const Award = require("../models/Award");
const sequelize = require('../config/database');

exports.getFilterData = async (req, res) => {
  try {
    // Fetch genres with movie count
    const genres = await Genre.findAll({
      attributes: [
        "id",
        "name",
        [sequelize.literal(`(
          SELECT COUNT(*) FROM movie_genre AS mg
          WHERE mg.genreid = "Genre".id
        )`), "movieCount"]
      ]
    });

    const years = await Movie.findAll({
        attributes: [
          [sequelize.fn('DATE_PART', 'year', sequelize.col('releasedate')), 'year'],
          [sequelize.fn('COUNT', sequelize.col('id')), 'movieCount']
        ],
        group: ['year'],
        order: [[sequelize.fn('DATE_PART', 'year', sequelize.col('releasedate')), 'DESC']], // DESC order
        raw: true,
      });

    // Fetch statuses with movie count
    const statuses = await Movie.findAll({
      attributes: [
        "status",
        [sequelize.fn("COUNT", sequelize.col("status")), "movieCount"]
      ],
      group: ["status"]
    });

    // Fetch availabilities with movie count
    const availabilities = await Availability.findAll({
      attributes: [
        "id",
        "name",
        [sequelize.literal(`(
          SELECT COUNT(*) FROM movie_availabilities AS ma
          WHERE ma.availid = "Availability".id
        )`), "movieCount"]
      ]
    });

    // Fetch awards with movie count
    const awards = await Award.findAll({
      attributes: [
        "id",
        "award",
        [sequelize.literal(`(
          SELECT COUNT(*) FROM movie_award AS ma
          WHERE ma.awardid = "Award".id
        )`), "movieCount"]
      ]
    });

    res.json({ genres, years, statuses, availabilities, awards });
  } catch (error) {
    console.error("Error fetching filter data:", error);
    res.status(500).json({ error: "Server error" });
  }
};
