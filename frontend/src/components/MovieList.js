import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

const MovieList = () => {
  const [movies, setMovies] = useState([]);

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await fetch('http://localhost:5000/api/movies/getAllMovies');
        const data = await response.json();
        setMovies(data);
      } catch (error) {
        console.error('Error fetching movies:', error);
      }
    };

    fetchMovies();
  }, []);

  return (
    <div className="grid grid-cols-4 gap-4 mt-9">
      {movies.map((movie) => (
        <Link 
          to={`/details/${movie._id}`} 
          key={movie._id} 
          className="bg-gray-400 p-4 rounded-lg shadow-md cursor-pointer"
        >
          <img 
            src={`http://localhost:5000/${movie.thumbnail}`} 
            alt={movie.title} 
            className="w-full h-64 object-cover rounded-md mb-2"
          />
          <h3 className="text-xl font-bold mb-2">{movie.title}</h3>
          <p className="text-gray-600">{movie.genres.join(", ")}</p>
          <p className="text-yellow-500 font-semibold">Rating: {movie.rating}</p>
        </Link>
      ))}
    </div>
  );
};

export default MovieList;
