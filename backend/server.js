const express = require('express');
const app = express();
const movieRoutes = require('./routes/movieRoutes');
const genreRoutes = require('./routes/genreRoutes');
const countryRoutes = require('./routes/countryRoutes');
const awardRoutes = require('./routes/awardRoutes');
const movieGenreRoutes = require('./routes/moviegenreRoutes');
const actorRoutes = require('./routes/actorRoutes');
const availRoutes = require('./routes/availRoutes');
const sequelize = require('./config/database'); 
const cors = require('cors');

app.use(cors());
app.use(express.json()); 

app.use('/api', movieRoutes);
app.use('/api', genreRoutes);
app.use('/api', countryRoutes);
app.use('/api', awardRoutes);
app.use('/api', movieGenreRoutes);
app.use('/api', actorRoutes);
app.use('/api', availRoutes);

// Tes koneksi database
sequelize.authenticate().then(() => {
  console.log('Database connected...');
}).catch(err => {
  console.error('Unable to connect to the database:', err);
});

app.listen(5000, () => {
  console.log('Server is running on port 5000');
});
