require('dotenv').config(); 
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(
    process.env.DATABASE_NAME,
    process.env.DATABASE_USER,
    process.env.DATABASE_PASSWORD,
    {
        host: process.env.DATABASE_HOST,
        dialect: process.env.DATABASE_DIALECT,
        logging: false 
    }
);

const connection = async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');

        await sequelize.sync({ alter: true });
        console.log('All models were synchronized successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
};

connection();

module.exports = sequelize;
