const Director = require("../models/Director");
const Country = require("../models/Countries");

exports.getAllDirector = async (req, res) => {
  try {
    const directors = await Director.findAll({
      include: [
        {
          model: Country,
          attributes: ["name"], // Sertakan nama country
        },
      ],
      order: [['name', 'ASC']], // Urutkan berdasarkan nama director
      logging: false,
    });
    res.status(200).json(directors);
  } catch (error) {
    console.error("Error fetching directors:", error);
    res.status(500).json({ error: "An error occurred" });
  }
};

exports.addDirector = async (req, res) => {
  try {
    const { name, birthdate, countryid, urlphoto } = req.body;

    if (!name || !birthdate || !countryid || !urlphoto) {
      return res.status(400).json({ error: "All fields are required" });
    }

    // Validasi apakah Country ada
    const country = await Country.findByPk(countryid);
    if (!country) {
      return res.status(404).json({ error: "Country not found" });
    }

    // Buat director baru
    const newDirector = await Director.create({
      name,
      birthdate,
      countryid,
      urlphoto,
    });

    // Sertakan data Country dalam response
    const directorWithCountry = await Director.findByPk(newDirector.id, {
      include: { model: Country, attributes: ["name"] },
    });

    res.status(201).json(directorWithCountry);
  } catch (error) {
    console.error("Error adding director:", error);
    res.status(500).json({ error: "An error occurred while adding the director" });
  }
};

exports.deleteDirector = async (req, res) => {
  try {
    const { id } = req.params;

    // Cari director berdasarkan id
    const director = await Director.findByPk(id);
    if (!director) {
      return res.status(404).json({ error: "Director not found" });
    }

    // Hapus director
    await director.destroy();
    res.status(200).json({ message: "Director deleted successfully" });
  } catch (error) {
    console.error("Error deleting director:", error);
    res.status(500).json({ error: "An error occurred while deleting the director" });
  }
};

exports.editDirector = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, birthdate, countryid, urlphoto } = req.body;

    // Cari director berdasarkan id
    const director = await Director.findByPk(id);
    if (!director) {
      return res.status(404).json({ error: "Director not found" });
    }

    // Update data director
    director.name = name;
    director.birthdate = birthdate;
    director.countryid = countryid;
    director.urlphoto = urlphoto;

    // Simpan perubahan
    await director.save();

    // Kembalikan director dengan relasi Country
    const updatedDirector = await Director.findByPk(director.id, {
      include: {
        model: Country, // Sertakan relasi Country dalam response
        attributes: ["name"],
      },
    });

    res.status(200).json(updatedDirector); // Kirim data director yang sudah diperbarui ke frontend
  } catch (error) {
    console.error("Error editing director:", error);
    res.status(500).json({ error: "An error occurred while editing the director" });
  }
};
