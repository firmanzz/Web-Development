import React, { useState, useEffect } from 'react';

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
    <div className="grid grid-cols-4 gap-4 mt-6">
      {movies.map((movie) => (
        <div key={movie._id} className="bg-white p-4 rounded-lg shadow-md">
          <img 
            src={`http://localhost:5000/${movie.thumbnail}`} 
            alt={movie.title} 
            className="w-100 h-100 object-cover rounded-md mb-2"
          />
          <h3 className="text-xl font-bold mb-2">{movie.title}</h3>
          <p className="text-gray-600">{movie.genres.join(", ")}</p>
          <p className="text-yellow-500 font-semibold">Rating: {movie.rating}</p>
        </div>
      ))}
    </div>
  );
};

export default MovieList;
