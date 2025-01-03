const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");
const Movie = require('./Movie');
const User = require('./User');

const Comment = sequelize.define(
  "Comment",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    comment: { type: DataTypes.STRING(1000) },
    movieid: {
      type: DataTypes.INTEGER,
      references: {
        model: Movie,
        key: "id",
      },
      allowNull: false,
    },
    userid: {
      type: DataTypes.INTEGER,
      references: {
        model: User,
        key: "id",
      },
      allowNull: false,
    },
    rate: {
      type: DataTypes.FLOAT,
      validate: {
        min: 1,
        max: 10,
      },
    },
    status: {
      type: DataTypes.ENUM("Approved", "Unapproved"),
      defaultValue: "Unapproved",
    },
    time: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW,
    },
  },
  {
    tableName: "comments",
    timestamps: false, }
);

module.exports = Comment;
