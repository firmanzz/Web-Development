const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieDirector = sequelize.define('MovieDirector', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'movies', key: 'id' } },
  directorid: { type: DataTypes.INTEGER, references: { model: 'directors', key: 'id' } }
}, {
    tableName: 'movie_director',
    timestamps: false
});
module.exports = MovieDirector;
