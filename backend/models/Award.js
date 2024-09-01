const mongoose = require('mongoose');

const awardSchema = new mongoose.Schema({
    country: {
        type: String,
        required: true
    },
    year: {
        type: Number,
        required: true
    },
    awardName: {
        type: String,
        required: true
    }
});

const Award = mongoose.model('Award', awardSchema);

module.exports = Award;
