const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Country = require('./Countries');

const Director = sequelize.define(
  "Director",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING(255), allowNull: false },
    birthdate: { type: DataTypes.DATE },
    urlphoto: { type: DataTypes.STRING(255) },
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
    tableName: "directors",
    timestamps: false,
  }
);

Director.belongsTo(Country, { foreignKey: "countryid" });
Country.hasMany(Director, { foreignKey: "countryid" });

module.exports = Director;
