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
  const [awards, setAwards] = useState([]); 
  const [statusOptions, setStatusOptions] = useState([]); 
  const [availabilityOptions, setAvailabilityOptions] = useState([]); 
  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    const fetchGenresAndMovies = async () => {
      try {
        const genreResponse = await fetch("http://localhost:5000/api/genres");
        const genreData = await genreResponse.json();
        setGenres(genreData);

        const awardResponse = await fetch("http://localhost:5000/api/awards");
        const awardData = await awardResponse.json();
        setAwards(awardData);

        const movieResponse = await fetch("http://localhost:5000/api/movies");
        const movieData = await movieResponse.json();

        const releaseYears = [
          ...new Set(
            movieData.map((movie) => new Date(movie.releasedate).getFullYear())
          ),
        ];
        setYears(releaseYears.sort((a, b) => b - a));

        const movieStats = [...new Set(movieData.map((movie) => movie.status))];
        setStatusOptions(movieStats.sort((a, b) => a.localeCompare(b)));

        const movieAvail = [
          ...new Set(movieData.map((movie) => movie.availability)),
        ];
        setAvailabilityOptions(movieAvail.sort((a, b) => a.localeCompare(b)));

      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchGenresAndMovies();
  }, []);

  return (
    <div className="flex flex-col space-y-4 mt-2 mb-2 px-4">
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
      <div
        className={`transition-max-height duration-500 ease-in-out ${
          isOpen ? "max-h-screen" : "max-h-0 overflow-hidden"
        }`}
      >
        <div className="flex flex-col space-y-4 mt-2 mb-2 px-4">
          <div className="flex flex-col items-center mb-4">
            <div className="flex flex-col md:flex-row md:space-x-4 space-y-4 md:space-y-0 w-full max-w-4xl">
              {/* Genre Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={genre}
                  onChange={(e) => setGenre(e.target.value)}
                >
                  <option value="">
                    All Genre
                  </option>
                  {genres.map((genre) => (
                    <option key={genre.id} value={genre.name}>
                      {genre.name}
                    </option>
                  ))}
                </select>
              </div>

              {/* Year Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={year}
                  onChange={(e) => setYear(e.target.value)}
                >
                  <option value="">
                    All Year
                  </option>
                  {years.map((year) => (
                    <option key={year} value={year}>
                      {year}
                    </option>
                  ))}
                </select>
              </div>

              {/* Status Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={status}
                  onChange={(e) => setStatus(e.target.value)}
                >
                  <option value="">
                    All Status
                  </option>
                  {statusOptions.map((option) => (
                    <option key={option} value={option}>
                      {option}
                    </option>
                  ))}
                </select>
              </div>

              {/* Availability Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={availability}
                  onChange={(e) => setAvailability(e.target.value)}
                >
                  <option value="">
                    All Availability
                  </option>
                  {availabilityOptions.map((option) => (
                    <option key={option} value={option}>
                      {option}
                    </option>
                  ))}
                </select>
              </div>

              {/* Award Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={award}
                  onChange={(e) => setAward(e.target.value)}
                >
                  <option value="">
                   All Award
                  </option>
                  {awards.map((award) => (
                    <option key={award.id} value={award.award}>
                      {award.award}
                    </option>
                  ))}
                </select>
              </div>
            </div>
            <button
            className="p-2 bg-blue-500 text-white rounded mx-auto block mt-5"
            onClick={handleSubmit}
          >
            Submit
          </button>
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
        </div>
      </div>
    </div>
  );
};

export default Filter;
