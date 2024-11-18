const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieAward = sequelize.define('MovieAward', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'movies', key: 'id' } },
  awardid: { type: DataTypes.INTEGER, references: { model: 'awards', key: 'id' } }
}, {
    tableName: 'movie_award',
    timestamps: false });

module.exports = MovieAward;
