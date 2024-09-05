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
  const [isOpen, setIsOpen] = useState(true); // State to control the accordion

  useEffect(() => {
    const fetchGenres = async () => {
      try {
        const response = await fetch(
          "http://localhost:5001/api/genres/getAllGenres"
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
          "http://localhost:5001/api/movies/getAllYears"
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
    <div className="flex flex-col space-y-4 mt-2 mb-2 px-4">
      {/* Accordion Header */}
      <button
        className="flex justify-between items-center w-full p-4 bg-gray-700 text-white rounded"
        onClick={() => setIsOpen(!isOpen)}
      >
        <span className="text-xl font-semibold">Filter</span>
        <svg
          className={`w-6 h-6 transform transition-transform ${
            isOpen ? "rotate-180" : "rotate-0"
          }`}
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M19 9l-7 7-7-7"
          />
        </svg>
      </button>

      {/* Accordion Content */}
      <div
        className={`transition-max-height duration-500 ease-in-out ${
          isOpen ? "max-h-screen" : "max-h-0 overflow-hidden"
        }`}
      >
        <div className="flex flex-col space-y-4 mt-2 mb-2 px-4">
          <div className="flex flex-col items-center mb-4">
            <div className="flex flex-col md:flex-row md:space-x-4 space-y-4 md:space-y-0 w-full max-w-4xl">
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
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
              </div>

              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
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
              </div>

              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={status}
                  onChange={(e) => setStatus(e.target.value)}
                >
                  <option value="" disabled hidden>
                    Status
                  </option>
                  {/* Populate options for status */}
                </select>
              </div>

              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={availability}
                  onChange={(e) => setAvailability(e.target.value)}
                >
                  <option value="" disabled hidden>
                    Availability
                  </option>
                  {/* Populate options for availability */}
                </select>
              </div>

              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={award}
                  onChange={(e) => setAward(e.target.value)}
                >
                  <option value="" disabled hidden>
                    Award
                  </option>
                  {/* Populate options for award */}
                </select>
              </div>
            </div>
          </div>

          {/* Sorted by Section */}
          <div className="flex flex-col items-center">
            <div className="flex flex-col w-full md:w-1/5">
              <select
                className="p-2 bg-gray-200 rounded w-full"
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
          </div>

          <button
            className="p-2 bg-blue-500 text-white rounded mx-auto block"
            onClick={handleSubmit}
          >
            Submit
          </button>
        </div>
      </div>
    </div>
  );
};

export default Filter;
