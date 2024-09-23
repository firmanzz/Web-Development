const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Movie = require('./Movie');
const Director = require('./Director');

const MovieDirector = sequelize.define('MovieDirector', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  movieid: { type: DataTypes.INTEGER, references: { model: Movie, key: 'id' }, allowNull: false },
  directorid: { type: DataTypes.INTEGER, references: { model: Director, key: 'id' }, allowNull: false }
}, {
    tableName: 'movie_director',
    timestamps: false
});

Movie.belongsToMany(Director, { through: MovieDirector, foreignKey: 'movieid', otherKey: 'directorid' });
Director.belongsToMany(Movie, { through: MovieDirector, foreignKey: 'directorid', otherKey: 'movieid' });

module.exports = MovieDirector;
