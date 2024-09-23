const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieAvail = sequelize.define('MovieAvailability', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'Movies', key: 'id' } },
  availid: { type: DataTypes.INTEGER, references: { model: 'Availability', key: 'id' } }
}, {
    tableName: 'movie_avail',
    timestamps: false });

module.exports = MovieAvail;