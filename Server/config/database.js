const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(
  process.env.POSTGRES_DB,
  process.env.POSTGRES_USER,
  process.env.POSTGRES_PASSWORD,
  {
    host: process.env.POSTGRES_HOST || 'localhost',
    dialect: 'postgres',
  }
);

module.exports = sequelize;
sequelize
  .authenticate()
  .then(() => console.log('Connected to PostgreSQL database'))
  .catch((err) => console.error('Unable to connect to the database:', err));

module.exports = sequelize;