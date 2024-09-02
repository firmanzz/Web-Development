import React, { useState, useEffect } from "react";

const Filter = ({
  genre,
  setGenre,
  year,
  setYear,
  status,
  setStatus,
  availability,
  setAvailability,
  award,
  setAward,
  sortOrder,
  setSortOrder,
  handleSubmit,
}) => {
  const [genres, setGenres] = useState([]);
  const [years, setYears] = useState([]);

  useEffect(() => {
    const fetchGenres = async () => {
      try {
        const response = await fetch(
          "http://localhost:5000/api/genres/getAllGenres"
        );
        const data = await response.json();
        setGenres(data);
      } catch (error) {
        console.error("Error fetching genres:", error);
      }
    };

    const fetchYears = async () => {
      try {
        const response = await fetch(
          "http://localhost:5000/api/movies/getAllYears"
        );
        const data = await response.json();
        setYears(data);
      } catch (error) {
        console.error("Error fetching years:", error);
      }
    };

    fetchGenres();
    fetchYears();
  }, []);

  return (
    <div className="flex flex-col space-y-4 mt-2 mb-2">
      <div className="flex flex-col md:flex-row md:space-x-4 space-y-4 md:space-y-0">
        <h1 className="text-white text-xl">Filtered by:</h1>
        <select
          className="w-full md:w-48 p-2 bg-gray-200 rounded"
          value={genre}
          onChange={(e) => setGenre(e.target.value)}
        >
          <option value="" disabled hidden>
            Genre
          </option>
          {genres.map((genre) => (
            <option key={genre._id} value={genre.name}>
              {genre.name}
            </option>
          ))}
        </select>

        <select
          className="w-full md:w-48 p-2 bg-gray-200 rounded"
          value={year}
          onChange={(e) => setYear(e.target.value)}
        >
          <option value="" disabled hidden>
            Year
          </option>
          {years.map((year) => (
            <option key={year} value={year}>
              {year}
            </option>
          ))}
        </select>

        <select
          className="w-full md:w-48 p-2 bg-gray-200 rounded"
          value={genre}
          onChange={(e) => setGenre(e.target.value)}
        >
          <option value="" disabled hidden>
            Status
          </option>
          {genres.map((genre) => (
            <option key={genre._id} value={genre.name}>
              {genre.name}
            </option>
          ))}
        </select>

        <select
          className="w-full md:w-48 p-2 bg-gray-200 rounded"
          value={genre}
          onChange={(e) => setGenre(e.target.value)}
        >
          <option value="" disabled hidden>
            Availability
          </option>
          {genres.map((genre) => (
            <option key={genre._id} value={genre.name}>
              {genre.name}
            </option>
          ))}
        </select>

        <select
          className="w-full md:w-48 p-2 bg-gray-200 rounded"
          value={genre}
          onChange={(e) => setGenre(e.target.value)}
        >
          <option value="" disabled hidden>
            Award
          </option>
          {genres.map((genre) => (
            <option key={genre._id} value={genre.name}>
              {genre.name}
            </option>
          ))}
        </select>

        <h1 className="text-white text-xl">Sorted by:</h1>
        <select
          className="w-full md:w-60 p-2 bg-gray-200 rounded"
          value={sortOrder}
          onChange={(e) => setSortOrder(e.target.value)}
        >
          <option value="" disabled hidden>
            Sort By
          </option>
          <option value="title">Title</option>
          <option value="rating">Rating</option>
        </select>
      </div>
      <button
        className="p-2 bg-blue-500 text-white rounded mx-auto block"
        onClick={handleSubmit}
      >
        Submit
      </button>
    </div>
  );
};

export default Filter;
