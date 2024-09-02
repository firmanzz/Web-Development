const mongoose = require('mongoose');

const movieSchema = mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    genres: [{
        type: String,
        required: true
    }],
    releaseYear: {
        type: Number,
        required: true
    },
    rating: {
        type: Number,
        required: true,
        min: 0,
        max: 10
    },
    duration: {
        type: Number,
        required: true
    },
    actors: [{
        actor_id: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Actor',
        },
        character_name: String
    }],
    directors: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Director',
    }],
    country: {
        type: String,
        required: true
    },
    thumbnail: {
        type: String
    }
}, {
    timestamps: true
});

const Movie = mongoose.model('Movie', movieSchema);

module.exports = Movie;
