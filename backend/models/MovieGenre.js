const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieGenre = sequelize.define('MovieGenre', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'movies', key: 'id' } },
  genreid: { type: DataTypes.INTEGER, references: { model: 'genres', key: 'id' } }
}, {
    tableName: 'movie_genre',
    timestamps: false });

module.exports = MovieGenre;
