const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const AdditionalInformation = sequelize.define('AdditionalInformation', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  location: {
    type: DataTypes.STRING,
  },
  profession: {
    type: DataTypes.STRING,
  },
  about_me: {
    type: DataTypes.TEXT,
  },
  soft_skills: {
    type: DataTypes.ARRAY(DataTypes.TEXT),
  },
  technical_skills: {
    type: DataTypes.ARRAY(DataTypes.TEXT),
  },
  languages: {
    type: DataTypes.ARRAY(DataTypes.TEXT),
  },
});

module.exports = AdditionalInformation;