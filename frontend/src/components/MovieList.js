import React, { useState, useEffect } from 'react';
import SearchBar from "./SearchBar";
import Filter from "./Filter";
import { Link } from 'react-router-dom';

const MovieList = ({ open, setOpen, genre, setGenre, year, setYear, status, setStatus, handleSubmit }) => {
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
    <div className="container mx-auto px-0">
      <div className="flex justify-center my-4">
        <SearchBar />
      </div>
      <Filter genre={genre} setGenre={setGenre} year={year} setYear={setYear} status={status} setStatus={setStatus} handleSubmit={handleSubmit} />
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-10 mt-10 mb-10">
        {movies.map((movie) => (
          <Link 
            to={`/details/${movie._id}`} 
            key={movie._id} 
            className="bg-gray-400 p-4 rounded-lg shadow-md cursor-pointer w-52 h-96"
          >
            <img 
              src="/assets/Movie1.jpg"
              alt={movie.title} 
              className="w-full h-60 object-cover rounded-md mb-2"
            />
            <h3 className="text-xl font-bold mb-2">{movie.title}</h3>
            <p className="text-gray-600">{movie.genres.join(", ")}</p>
            <p className="text-yellow-500 font-semibold">Rating: {movie.rating}</p>
          </Link>
        ))}
      </div>
    </div>
  );
};

export default MovieList;
