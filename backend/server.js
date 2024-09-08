const express = require('express');
const app = express();
const movieRoutes = require('./routes/movieRoutes');
const genreRoutes = require('./routes/genreRoutes')
const sequelize = require('./config/database'); 
const cors = require('cors');

app.use(cors());
app.use(express.json()); 

// Route untuk Movie API
app.use('/api', movieRoutes);
app.use('/api', genreRoutes);

// Tes koneksi database
sequelize.authenticate().then(() => {
  console.log('Database connected...');
}).catch(err => {
  console.error('Unable to connect to the database:', err);
});

app.listen(5000, () => {
  console.log('Server is running on port 5000');
});
