const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieActor = sequelize.define('MovieActor', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'Movies', key: 'id' } },
  actorid: { type: DataTypes.INTEGER, references: { model: 'Actors', key: 'id' } }
}, {
    tableName: 'movie_actor',
    timestamps: false });

module.exports = MovieActor;
