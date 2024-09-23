const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MovieDirector = sequelize.define('MovieDirector', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: 'Movies', key: 'id' } },
  directorid: { type: DataTypes.INTEGER, references: { model: 'Directors', key: 'id' } }
}, {
    tableName: 'movie_director',
    timestamps: false
});
module.exports = MovieDirector;
