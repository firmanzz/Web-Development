const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Country = require('./Countries');
const Genre = require('./Genre');
const MovieGenre = require('./MovieGenre'); 
const Award = require('./Award');
const MovieAward = require('./MovieAward');
const Actor = require('./Actor');
const MovieActor = require('./MovieActor');

const Movie = sequelize.define(
  "Movie",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING(100), allowNull: false },
    alternativetitle: { type: DataTypes.STRING(100) },
    synopsis: { type: DataTypes.STRING(1000) },
    urlphoto: { type: DataTypes.STRING(255) },
    releasedate: { type: DataTypes.DATE },
    availability: { type: DataTypes.STRING(255) },
    linktrailer: { type: DataTypes.STRING(255) },
    rating: { type: DataTypes.FLOAT },
    duration: { type: DataTypes.FLOAT },
    status: { type: DataTypes.STRING(25) },
    approvalstatus: { type: DataTypes.BOOLEAN },
    countryid: {
      type: DataTypes.INTEGER,
      references: {
        model: Country,
        key: "id",
      },
      allowNull: false,
    },
  },
  {
    tableName: "movies",
    timestamps: false,
  }
);

Movie.belongsTo(Country, { foreignKey: "countryid" });
Country.hasMany(Movie, { foreignKey: "countryid" });

Movie.belongsToMany(Genre, { through: MovieGenre, foreignKey: 'movieid', otherKey: 'genreid' });
Genre.belongsToMany(Movie, { through: MovieGenre, foreignKey: 'genreid', otherKey: 'movieid' });
Movie.belongsToMany(Award, { through: MovieAward, foreignKey: 'movieid', otherKey: 'awardid' });
Award.belongsToMany(Movie, { through: MovieAward, foreignKey: 'awardid', otherKey: 'movieid' });
Movie.belongsToMany(Actor, { through: MovieActor, foreignKey: 'movieid', otherKey: 'actorid' });
Actor.belongsToMany(Movie, { through: MovieActor, foreignKey: 'actorid', otherKey: 'movieid' });


module.exports = Movie;
