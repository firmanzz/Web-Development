const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const User = sequelize.define('User', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  name: { type: DataTypes.STRING(100), allowNull: false },
  email: { type: DataTypes.STRING(100), allowNull: false, unique: true },
  password: { type: DataTypes.STRING(255), allowNull: false },
  role: { type: DataTypes.ENUM('admin', 'editor'), defaultValue: 'editor', allowNull: false },
  verificationCode : { type: DataTypes.STRING(255), allowNull: true },
  isVerified : { type: DataTypes.BOOLEAN, defaultValue: false, allowNull: false }
}, {
  tableName: 'users',
  timestamps: true
});

module.exports = User;
