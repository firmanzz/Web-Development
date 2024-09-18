const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const Country = require('./Countries');

const Actor = sequelize.define(
  "Actor",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING(50), allowNull: false },
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
    tableName: "actors",
    timestamps: false,
  }
);

Actor.belongsTo(Country, { foreignKey: "countryid" });
Country.hasMany(Actor, { foreignKey: "countryid" });


module.exports = Actor;
