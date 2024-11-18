const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Country = require('./Countries');

const Movie = sequelize.define(
  "Movie",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING(100), allowNull: false },
    alternativetitle: { type: DataTypes.STRING(100) },
    synopsis: { type: DataTypes.TEXT },
    urlphoto: { type: DataTypes.STRING(255) },
    releasedate: { type: DataTypes.DATE },
    linktrailer: { type: DataTypes.STRING(255) },
    rating: { type: DataTypes.FLOAT },
    duration: { type: DataTypes.FLOAT },
    status: { type: DataTypes.STRING(25) },
    approvalstatus: { type: DataTypes.BOOLEAN, defaultValue: false },
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

module.exports = Movie;
