const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieAvailability = sequelize.define('MovieAvailability', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'Movies', key: 'id' } },
  availid: { type: DataTypes.INTEGER, references: { model: 'Availabilities' , key: 'id' } }
}, {
    tableName: 'movie_availabilities',
    timestamps: false
});

module.exports = MovieAvailability;
