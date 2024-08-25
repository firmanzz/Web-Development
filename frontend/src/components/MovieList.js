import React, { useState, useEffect } from 'react';
import MovieDetail from './MovieDetail';

const MovieList = () => {
  const [movies, setMovies] = useState([]);
  const [selectedMovie, setSelectedMovie] = useState(null); // Tambahkan state untuk film yang dipilih

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

  const handleMovieClick = (movie) => {
    setSelectedMovie(movie);
  };

  if (selectedMovie) {
    // Tampilkan detail film jika film dipilih
    return <MovieDetail movie={selectedMovie} />;
  }

  return (
    <div className="grid grid-cols-4 gap-4 mt-6">
      {movies.map((movie) => (
        <div 
          key={movie._id} 
          className="bg-white p-4 rounded-lg shadow-md cursor-pointer"
          onClick={() => handleMovieClick(movie)} // Setel film yang dipilih saat diklik
        >
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
