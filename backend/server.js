const express = require('express');
const app = express();
const movieRoutes = require('./routes/movieRoutes');
const genreRoutes = require('./routes/genreRoutes');
const countryRoutes = require('./routes/countryRoutes');
const awardRoutes = require('./routes/awardRoutes');
const movieGenreRoutes = require('./routes/moviegenreRoutes');
const actorRoutes = require('./routes/actorRoutes');
const directorRoutes = require('./routes/directorRoutes');
const availRoutes = require('./routes/availRoutes');
const movieDetailRoutes = require('./routes/movieDetailRoutes');
const sequelize = require('./config/database');
const userRoutes = require('./routes/userRoutes');
const commentRoutes = require('./routes/commentRoutes');
const filterRoutes = require('./routes/filterRoutes');
const passport = require('./config/passport'); 
const cors = require('cors');
require('dotenv').config({ path: require('path').resolve(__dirname, './.env') });

// Import middleware
const authMiddleware = require('./middleware/authMiddleware');
const adminMiddleware = require('./middleware/adminMiddleware');

const corsOptions = {
  origin: 'http://web-development-beta-opal.vercel.app', // Ganti ini dengan URL frontend Anda
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true, // Jika Anda menggunakan cookies atau credentials lain
};

app.use(cors(corsOptions));
app.use(express.json());
app.use(passport.initialize());

// Rute yang tidak memerlukan autentikasi
app.get('/', (req, res) => {
  res.send('Selamat datang di halaman utama!');
});

// Rute API yang dapat diakses oleh semua pengguna
app.use('/api', movieRoutes);
app.use('/api', genreRoutes);
app.use('/api', countryRoutes);
app.use('/api', awardRoutes);
app.use('/api', movieGenreRoutes);
app.use('/api', actorRoutes);
app.use('/api', directorRoutes);
app.use('/api', availRoutes);
app.use('/api', movieDetailRoutes);
app.use('/api', commentRoutes);
app.use('/api', userRoutes);
app.use('/api', filterRoutes);

// Rute khusus admin yang dilindungi oleh middleware autentikasi dan admin
app.use('/admin', authMiddleware, adminMiddleware, (req, res, next) => {
  if (!req.user) {
    return res.redirect('//Login');
  }
  res.send('Selamat datang di halaman admin!');
});

// Tes koneksi database
sequelize.authenticate().then(() => {
  console.log('Database connected...');
}).catch(err => {
  console.error('Unable to connect to the database:', err);
});

app.listen(5000, () => {
  console.log('Server is running on port 5000');
});

module.exports = app;