const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");

const Comment = sequelize.define(
  "Comment",
  {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    comment: { type: DataTypes.STRING(1000) },
    movieid: {
      type: DataTypes.INTEGER,
      references: { model: "Movies", key: "id" },
    },
    userid: {
      type: DataTypes.INTEGER,
      references: { model: "Users", key: "id" },
    },
    rate: {
      type: DataTypes.FLOAT,
      validate: {
        min: 1,
        max: 5,
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
