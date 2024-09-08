const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Genre = sequelize.define('Genre', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  name: { type: DataTypes.STRING(25), allowNull: false }
}, {
    tableName: 'genres', 
    timestamps: false });

module.exports = Genre;
