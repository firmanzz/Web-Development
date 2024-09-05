const express = require('express');
const connectDB = require('./config/db');
const userRoutes = require('./routes/userRoutes');
const movieRoutes = require('./routes/movieRoutes');
const genreRoutes = require('./routes/genreRoutes');
const awardRoutes = require('./routes/awardRoutes');
const commentRoutes = require('./routes/commentRoutes');
const bodyParser = require('body-parser');
const path = require('path');
const axios = require('axios');
const cors = require('cors');
require('dotenv').config();

connectDB();

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true })); // To parse URL-encoded data
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Serve static files
app.use('/uploads', express.static(path.join(__dirname, 'static/uploads')));
app.use(express.static(path.join(__dirname, 'public')));

// Route handlers
app.use('/api/users', userRoutes);
app.use('/api/movies', movieRoutes);
app.use('/api/genres', genreRoutes);
app.use('/api/awards', awardRoutes); // Adjust route if necessary
app.use('/api/comments', commentRoutes); // Adjust route if necessary

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
