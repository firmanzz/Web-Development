import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';

const MovieDetail = () => {
  const { id } = useParams();
  const [movie, setMovie] = useState(null);

  useEffect(() => {
    const fetchMovie = async () => {
      try {
        const response = await fetch(`http://localhost:5000/api/movies/getByIDMovie/${id}`);
        const data = await response.json();
        setMovie(data);
      } catch (error) {
        console.error('Error fetching movie:', error);
      }
    };

    fetchMovie();
  }, [id]);

  if (!movie) {
    return <p>Loading...</p>;
  }

  return (
    <div className="p-8 bg-white">
      <header className="mb-6">
        <h1 className="text-4xl font-bold">DramaKu</h1>
      </header>
      <div className="flex mb-6">
        <img 
          src={`http://localhost:5000/${movie.thumbnail}`} 
          alt={movie.title} 
          className="w-64 h-96 object-cover rounded-md"
        />
        <div className="ml-6">
          <h2 className="text-3xl font-bold">{movie.title}</h2>
          <p className="text-lg text-gray-600">Other title: {movie.title}</p>
          <p className="text-lg text-gray-600">Year: {movie.releaseYear}</p>
          <p className="mt-4">
            Synopsis: {movie.description}
          </p>
          <p className="mt-4">Genres: {movie.genres.join(", ")}</p>
          <p className="mt-2">Rating: {movie.rating}/10</p>
          <p className="mt-2">Availability: Netflix, Episode 1-12</p>
        </div>
      </div>

      {/* Placeholder sections untuk aktor, video player, dan komentar tetap sama */}
    </div>
  );
};

export default MovieDetail;
