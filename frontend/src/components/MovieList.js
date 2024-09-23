import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import SearchBar from "../components/SearchBar";
import Filter from "../components/Filter";

const MovieList = () => {
  const [genre, setGenre] = useState("");
  const [year, setYear] = useState("");
  const [status, setStatus] = useState("");
  const [availability, setAvailability] = useState("");
  const [award, setAward] = useState("");
  const [sortOrder, setSortOrder] = useState("");
  const [searchQuery, setSearchQuery] = useState(""); 

  const [movies, setMovies] = useState([]);
  const [filteredMovies, setFilteredMovies] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [moviesPerPage] = useState(18);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [currentIndex, setCurrentIndex] = useState(0);

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/movies");
        if (!response.ok) {
          throw new Error(`Failed to fetch movies: ${response.statusText}`);
        }
        const data = await response.json();
        setMovies(data);
        setFilteredMovies(data);
        setLoading(false);
      } catch (error) {
        console.error("Error fetching movies:", error);
        setError("Failed to load movies. Please try again later.");
        setLoading(false);
      }
    };

    fetchMovies();
  }, []);

  const handleSubmit = () => {
    let filtered = movies;

    // Search Logic (title, genre, availability, etc.)
    if (searchQuery) {
      const lowerCaseQuery = searchQuery.toLowerCase();
      filtered = filtered.filter((movie) => {
        return (
          movie.title.toLowerCase().includes(lowerCaseQuery) || // Search in title
          movie.Genres.some((g) => g.name.toLowerCase().includes(lowerCaseQuery)) || // Search in genres
          movie.Availability.some ((b) => b.name.toLowerCase().includes(lowerCaseQuery)) || // Search in availability
          movie.Awards.some((a) => a.award.toLowerCase().includes(lowerCaseQuery)) // Search in awards
        );
      });
    }

    // Apply any additional filters like year, genre, etc. (if needed)
    setFilteredMovies(filtered); // Update filtered movies
  };

  const handleSort = (movies, sortOrder) => {
    if (sortOrder === "title") {
      return movies.sort((a, b) => a.title.localeCompare(b.title));
    } else if (sortOrder === "rating") {
      return movies.sort((a, b) => b.rating - a.rating);
    } else {
      return movies;
    }
  };

  const handlePrevClick = () => {
    setCurrentIndex((prevIndex) =>
      prevIndex === 0 ? movies.length - 1 : prevIndex - 1
    );
  };

  const handleNextClick = () => {
    setCurrentIndex((prevIndex) =>
      prevIndex === movies.length - 1 ? 0 : prevIndex + 1
    );
  };

  const indexOfLastMovie = currentPage * moviesPerPage;
  const indexOfFirstMovie = indexOfLastMovie - moviesPerPage;
  const currentMovies = handleSort(filteredMovies, sortOrder).slice(
    indexOfFirstMovie,
    indexOfLastMovie
  );

  const paginate = (pageNumber) => setCurrentPage(pageNumber);
  const totalPages = Math.ceil(filteredMovies.length / moviesPerPage);

  const featuredMovie = movies[currentIndex];

  return (
    <div className="container mx-auto">
      <div className="flex justify-center my-4">
        {/* Pass handleSubmit as handleSearchSubmit to SearchBar */}
        <SearchBar searchQuery={searchQuery} setSearchQuery={setSearchQuery} handleSearchSubmit={handleSubmit} />
      </div>
      {loading ? (
        <p className="text-white text-center">Loading movies...</p>
      ) : error ? (
        <p className="text-red-500 text-center">{error}</p>
      ) : (
        <>
          {featuredMovie && (
            <div className="mb-8 hidden md:block relative">
              <button
                onClick={handlePrevClick}
                className="absolute left-0 top-1/2 transform -translate-y-1/2 bg-gray-800 text-white text-5xl px-3 py-2 rounded-full"
              >
                &lt;
              </button>

              <div className="relative bg-gray-800 rounded-md overflow-hidden mx-auto h-[48rem] sm:w-[33rem]">
                <Link to={`/details/${featuredMovie.id}`} className="block">
                  <img
                    src={featuredMovie.urlphoto}
                    alt={featuredMovie.title}
                    className="absolute inset-0 w-full h-full object-cover rounded-md"
                    style={{ objectFit: "cover" }}
                  />
                  <div className="absolute inset-0 bg-black bg-opacity-40 flex flex-col justify-center items-center">
                    <h2 className="text-white text-2xl sm:text-3xl font-bold text-center">
                      {featuredMovie.title}
                    </h2>
                    <p className="text-white text-lg font-semibold text-center">
                      {featuredMovie.Genres
                        ? featuredMovie.Genres.map((genre) => genre.name).join(", ")
                        : "No Genres"}
                    </p>
                    <p className="text-yellow-500 text-lg font-semibold text-center">
                      Rating: {featuredMovie.rating}
                    </p>
                  </div>
                </Link>
              </div>

              <button
                onClick={handleNextClick}
                className="absolute right-0 top-1/2 transform -translate-y-1/2 bg-gray-800 text-white text-5xl px-3 py-2 rounded-full"
              >
                &gt;
              </button>
            </div>
          )}

          <Filter
            genre={genre}
            setGenre={setGenre}
            year={year}
            setYear={setYear}
            status={status}
            setStatus={setStatus}
            availability={availability}
            setAvailability={setAvailability}
            award={award}
            setAward={setAward}
            handleSubmit={handleSubmit}
            sortOrder={sortOrder}
            setSortOrder={setSortOrder}
          />
          <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-16 mt-10 mb-10">
            {currentMovies.map((movie) => (
              <Link to={`/details/${movie.id}`} key={movie.id}>
                <div className="text-center">
                  <img
                    src={movie.urlphoto}
                    alt={movie.urlphoto}
                    className="h-full w-full object-cover rounded-md mb-2"
                  />
                  <h3 className="text-white text-sm font-bold mb-1">
                    {movie.title}
                  </h3>
                  <p className="text-white text-sm font-semibold">
                    {movie.Genres
                      ? movie.Genres.map((genre) => genre.name).join(", ")
                      : "No Genres"}
                  </p>
                  <p className="text-yellow-500 text-xs font-semibold">
                    Rating: {movie.rating}
                  </p>
                </div>
              </Link>
            ))}
          </div>
          <div className="flex justify-center my-4">
            <nav>
              <ul className="flex list-none">
                {Array.from({ length: totalPages }, (_, i) => (
                  <li
                    key={i + 1}
                    className={`mx-1 ${
                      currentPage === i + 1 ? "text-blue-500" : ""
                    }`}
                  >
                    <button
                      onClick={() => paginate(i + 1)}
                      className="px-3 py-1 bg-gray-700 text-white rounded hover:bg-gray-600 mb-6"
                    >
                      {i + 1}
                    </button>
                  </li>
                ))}
              </ul>
            </nav>
          </div>
        </>
      )}
    </div>
  );
};

export default MovieList;
