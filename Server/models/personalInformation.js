const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Creds = require('./creds');  // Foreign key reference

const PersonalInformation = sequelize.define('PersonalInformation', {
  uid: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  creds_uid: {
    type: DataTypes.INTEGER,
    references: {
      model: Creds,
      key: 'uid',
    },
  },
  full_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  phone_number: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

module.exports = PersonalInformation;