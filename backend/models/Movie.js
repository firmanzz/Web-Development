const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const Country = require("./Countries");
const Genre = require("./Genre");

const Movie = sequelize.define(
  "Movie",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING(25), allowNull: false },
    alternativetitle: { type: DataTypes.STRING(25) },
    synopsis: { type: DataTypes.STRING(255) },
    urlphoto: { type: DataTypes.STRING(255) },
    releasedate: { type: DataTypes.DATE },
    availability: { type: DataTypes.STRING(255) },
    linktrailer: { type: DataTypes.STRING(255) },
    rating: { type: DataTypes.FLOAT },
    duration: { type: DataTypes.FLOAT },
    status: { type: DataTypes.STRING(25) },
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
Movie.belongsToMany(Genre, { through: 'MovieGenre', foreignKey: 'movieid', as: 'genres' });
Genre.belongsToMany(Movie, { through: 'MovieGenre', foreignKey: 'genreid', as: 'movies' });

module.exports = Movie;
