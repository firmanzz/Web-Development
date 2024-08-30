import React, { useState, useEffect } from 'react';

const Filter = ({ genre, setGenre, year, setYear, status, setStatus, availability, setAvailability, award, setAward, handleSubmit }) => {
  const [genres, setGenres] = useState([]);
  const [years, setYears] = useState([]);

  useEffect(() => {
    const fetchGenres = async () => {
      try {
        const response = await fetch('http://localhost:5000/api/genres/getAllGenres');
        const data = await response.json();
        setGenres(data);
      } catch (error) {
        console.error('Error fetching genres:', error);
      }
    };

    const fetchYears = async () => {
      try {
        const response = await fetch('http://localhost:5000/api/movies/getAllYears');
        const data = await response.json();
        setYears(data);
      } catch (error) {
        console.error('Error fetching years:', error);
      }
    };

    fetchGenres();
    fetchYears();
  }, []);

  return (
    <div className="flex flex-col space-y-2 mb-2 w-full">
      <div className="flex flex-wrap space-y-2 sm:space-y-0 sm:space-x-3">
        <h1 className='text-white text-md'>Filtered by:</h1>
        <select
          className="w-full sm:w-36 p-1 bg-gray-200 rounded text-sm"
          value={genre}
          onChange={(e) => setGenre(e.target.value)}
        >
          <option value="" disabled hidden>Genre</option>
          {genres.map((genre) => (
            <option key={genre._id} value={genre.name}>
              {genre.name}
            </option>
          ))}
        </select>

        <select
          className="w-full sm:w-36 p-1 bg-gray-200 rounded text-sm"
          value={year}
          onChange={(e) => setYear(e.target.value)}
        >
          <option value="" disabled hidden>Year</option>
          {years.map((year) => (
            <option key={year} value={year}>
              {year}
            </option>
          ))}
        </select>

        <select
          className="w-full sm:w-36 p-1 bg-gray-200 rounded text-sm"
          value={status}
          onChange={(e) => setStatus(e.target.value)}
        >
          <option value="" disabled hidden>Status</option>
          <option value="Ongoing">Ongoing</option>
          <option value="Completed">Completed</option>
        </select>

        <select
          className="w-full sm:w-36 p-1 bg-gray-200 rounded text-sm"
          value={availability}
          onChange={(e) => setAvailability(e.target.value)}
        >
          <option value="" disabled hidden>Availability</option>
          <option value="Ongoing">Ongoing</option>
          <option value="Completed">Completed</option>
        </select>

        <select
          className="w-full sm:w-36 p-1 bg-gray-200 rounded text-sm"
          value={award}
          onChange={(e) => setAward(e.target.value)}
        >
          <option value="" disabled hidden>Award</option>
          <option value="Ongoing">Ongoing</option>
          <option value="Completed">Completed</option>
        </select>

        <h1 className='text-white text-md'>Sorted by:</h1>

        <select
          className="w-full sm:w-36 p-1 bg-gray-200 rounded text-sm"
          value={award}
          onChange={(e) => setAward(e.target.value)}
        >
          <option value="" disabled hidden>Alphabetical</option>
          <option value="Ongoing">Ongoing</option>
          <option value="Completed">Completed</option>
        </select>
      </div>
      <button className="p-2 bg-blue-500 text-white rounded self-center text-sm" onClick={handleSubmit}>
        Submit
      </button>
    </div>
  );
};

export default Filter;
