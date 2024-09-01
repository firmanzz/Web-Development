const Award = require('../models/Award');

// Get all awards
exports.getAllAwards = async (req, res) => {
    try {
        const awards = await Award.find();
        res.render('awards', { awards });
    } catch (err) {
        res.status(500).send('Server Error');
    }
};

// Create a new award
exports.createAward = async (req, res) => {
    try {
        const { country, year, awardName } = req.body;
        const newAward = new Award({
            country,
            year,
            awardName
        });
        await newAward.save();
        res.redirect('/awards');
    } catch (err) {
        res.status(500).send('Server Error');
    }
};

// Edit an award
exports.editAward = async (req, res) => {
    try {
        const { id } = req.params;
        const { country, year, awardName } = req.body;
        await Award.findByIdAndUpdate(id, { country, year, awardName });
        res.redirect('/awards');
    } catch (err) {
        res.status(500).send('Server Error');
    }
};

// Delete an award
exports.deleteAward = async (req, res) => {
    try {
        const { id } = req.params;
        await Award.findByIdAndDelete(id);
        res.redirect('/awards');
    } catch (err) {
        res.status(500).send('Server Error');
    }
};
