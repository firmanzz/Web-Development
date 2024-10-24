const Award = require("../models/Award");
const Country = require("../models/Countries");

// Get all awards
exports.getAllAwards = async (req, res) => {
  try {
    const awards = await Award.findAll({
      include: [
        {
          model: Country,
          attributes: ["name"],
        },
      ],
      order: [['year', 'DESC']],
      logging: false,
    });
    res.status(200).json(awards);
  } catch (error) {
    console.error("Error fetching awards:", error);
    res.status(500).json({ error: "An error occurred while fetching awards" });
  }
};

exports.addAward = async (req, res) => {
  try {
    const { award, year, countryid } = req.body;

    if (!award || !year || !countryid) {
      return res.status(400).json({ error: "All fields are required" });
    }

    const country = await Country.findByPk(countryid);
    if (!country) {
      return res.status(404).json({ error: "Country not found" });
    }

    const newAward = await Award.create({
      award,
      year,
      countryid,
    });

    const awardWithCountry = await Award.findByPk(newAward.id, {
      include: { model: Country, attributes: ["name"] },
    });

    res.status(201).json(awardWithCountry);
  } catch (error) {
    console.error("Error adding award:", error); // Ini untuk melihat detail error di console
    res.status(500).json({ error: `An error occurred: ${error.message}` }); // Mengirim error yang lebih jelas ke frontend
  }
};


// Edit award
exports.editAward = async (req, res) => {
  try {
    const { id } = req.params;
    const { award, year, countryid } = req.body;

    // Find award by id
    const existingAward = await Award.findByPk(id);
    if (!existingAward) {
      return res.status(404).json({ error: "Award not found" });
    }

    // Validate if country exists
    const country = await Country.findByPk(countryid);
    if (!country) {
      return res.status(404).json({ error: "Country not found" });
    }

    // Update award data
    existingAward.award = award;
    existingAward.year = year;
    existingAward.countryid = countryid;

    // Save the updated award
    await existingAward.save();

    // Fetch the updated award with the country information
    const updatedAward = await Award.findByPk(existingAward.id, {
      include: { model: Country, attributes: ["name"] },
    });

    res.status(200).json(updatedAward);
  } catch (error) {
    console.error("Error editing award:", error);
    res.status(500).json({ error: "An error occurred while editing the award" });
  }
};

// Delete award
exports.deleteAward = async (req, res) => {
  try {
    const { id } = req.params;

    // Find the award by id
    const award = await Award.findByPk(id);
    if (!award) {
      return res.status(404).json({ error: "Award not found" });
    }

    // Delete the award
    await award.destroy();
    res.status(200).json({ message: "Award deleted successfully" });
  } catch (error) {
    console.error("Error deleting award:", error);
    res.status(500).json({ error: "An error occurred while deleting the award" });
  }
};
