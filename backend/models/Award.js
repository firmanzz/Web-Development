const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Country = require('./Countries');

const Award = sequelize.define(
  "Award",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    award: { type: DataTypes.STRING(255), allowNull: false },
    year: { type: DataTypes.INTEGER },
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
    tableName: "awards",
    timestamps: false,
  }
);

Award.belongsTo(Country, { foreignKey: "countryid" });
Country.hasMany(Award, { foreignKey: "countryid" });

module.exports = Award;
