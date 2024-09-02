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
app.set('view engine', 'ejs');
app.use(express.json());

app.set('views', path.join(__dirname, 'views'));

app.use('/api/users', userRoutes);
app.use('/api/movies', movieRoutes);
app.use('/uploads', express.static('static/uploads'));
app.use('/api/genres', genreRoutes);
app.use(express.static('public'));
app.use('/', awardRoutes); // Added awardRoutes
app.use('/', commentRoutes); // Added commentRoutes
app.use('/', userRoutes); // Added userRoutes

app.get('/', async (req, res) => {
    try {
        const open = true; 
        const submenuOpen = false;
        const response = await axios.get('http://localhost:5000/api/movies/getAllMovies');
        const movies = response.data;
        res.render('movie', { open, submenuOpen, movies });
    } catch (error) {
        console.error('Error fetching movies:', error);
        res.status(500).send('Server Error');
    }
});

app.get('/addMovie', (req, res) => {
    res.render('form movie');
});

app.get('/movies/edit/:id', async (req, res) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/movies/getByIDMovie/${req.params.id}`);
        const movie = response.data;

        if (!movie) {
            return res.status(404).send('Movie not found');
        }

        res.render('edit-movie', { movie });
    } catch (error) {
        console.error('Error fetching movie:', error);
        res.status(500).send('Server Error');
    }
});

app.get('/countries', async (req, res) => {
    try {
        const response = await axios.get('http://localhost:5000/api/movies/getAllMovies');
        const movies = response.data;
        res.render('countries', { movies });
    } catch (error) {
        console.error('Error fetching movies:', error);
        res.status(500).send('Server Error');
    }
});

app.get('/actors', async (req, res) => {
    try {
        const response = await axios.get('http://localhost:5000/api/movies/getAllMovies');
        const movies = response.data;
        res.render('actors', { movies });
    } catch (error) {
        console.error('Error fetching movies:', error);
        res.status(500).send('Server Error');
    }
});

const PORT = process.env.PORT || 5001;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
