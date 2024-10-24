const Actor = require("../models/Actor");
const Country = require("../models/Countries");

exports.getAllActor = async (req, res) => {
  try {
    const actors = await Actor.findAll({
      include: [
        {
          model: Country,
          attributes: ["name"], 
        },
      ],
      order: [['name', 'ASC']],
      logging: false,
    });
    res.status(200).json(actors);
  } catch (error) {
    console.error("Error fetching actors:", error);
    res.status(500).json({ error: "An error occurred" });
  }
};

exports.addActor = async (req, res) => {
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

    // Buat aktor baru
    const newActor = await Actor.create({
      name,
      birthdate,
      countryid,
      urlphoto,
    });

    // Sertakan data Country dalam response
    const actorWithCountry = await Actor.findByPk(newActor.id, {
      include: { model: Country, attributes: ["name"] },
    });

    res.status(201).json(actorWithCountry);
  } catch (error) {
    console.error("Error adding actor:", error);
    res.status(500).json({ error: "An error occurred while adding the actor" });
  }
};


exports.deleteActor = async (req, res) => {
  try {
    const { id } = req.params;

    // Cari aktor berdasarkan id
    const actor = await Actor.findByPk(id);
    if (!actor) {
      return res.status(404).json({ error: "Actor not found" });
    }

    // Hapus aktor
    await actor.destroy();
    res.status(200).json({ message: "Actor deleted successfully" });
  } catch (error) {
    console.error("Error deleting actor:", error);
    res.status(500).json({ error: "An error occurred while deleting the actor" });
  }
};

exports.editActor = async (req, res) => {
  try {
    const { id } = req.params;
    const { name, birthdate, countryid, urlphoto } = req.body;

    // Cari aktor berdasarkan id
    const actor = await Actor.findByPk(id);
    if (!actor) {
      return res.status(404).json({ error: "Actor not found" });
    }

    // Update data aktor
    actor.name = name;
    actor.birthdate = birthdate;
    actor.countryid = countryid;
    actor.urlphoto = urlphoto;

    // Simpan perubahan
    await actor.save();

    // Kembalikan aktor dengan relasi Country
    const updatedActor = await Actor.findByPk(actor.id, {
      include: {
        model: Country, // Sertakan relasi Country dalam response
        attributes: ["name"],
      },
    });

    res.status(200).json(updatedActor); // Kirim data aktor yang sudah diperbarui ke frontend
  } catch (error) {
    console.error("Error editing actor:", error);
    res.status(500).json({ error: "An error occurred while editing the actor" });
  }
};
