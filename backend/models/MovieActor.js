const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieActor = sequelize.define('MovieActor', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'movies', key: 'id' } },
  actorid: { type: DataTypes.INTEGER, references: { model: 'actors', key: 'id' } }
}, {
    tableName: 'movie_actor',
    timestamps: false });

module.exports = MovieActor;
