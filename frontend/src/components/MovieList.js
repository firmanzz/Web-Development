import React, { useState, useEffect } from "react";
import SearchBar from "../components/SearchBar";
import Filter from "../components/Filter";
import { Link } from "react-router-dom";

const MovieList = () => {
  const [movies, setMovies] = useState([]);
  const [genre, setGenre] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [moviesPerPage] = useState(18);
  const [year, setYear] = useState("");
  const [status, setStatus] = useState("");
  const [sortOrder, setSortOrder] = useState("");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // Fetch movies from the backend
  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/movies");
        
        if (!response.ok) {
          throw new Error(`Failed to fetch movies: ${response.statusText}`);
        }

        const data = await response.json();
        
        if (!Array.isArray(data)) {
          throw new Error("Invalid movie data format");
        }

        setMovies(data);
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
    // Logic for handling filter submit
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

  // Pagination logic
  const indexOfLastMovie = currentPage * moviesPerPage;
  const indexOfFirstMovie = indexOfLastMovie - moviesPerPage;
  const currentMovies = handleSort(movies, sortOrder).slice(
    indexOfFirstMovie,
    indexOfLastMovie
  );

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  const totalPages = Math.ceil(movies.length / moviesPerPage);

  const featuredMovie = movies.length > 0 ? movies[0] : null;

  return (
    <div className="container mx-auto px-4">
      <div className="flex justify-center my-4">
        <SearchBar />
      </div>
      {loading ? (
        <p className="text-white text-center">Loading movies...</p>
      ) : error ? (
        <p className="text-red-500 text-center">{error}</p>
      ) : (
        <>
          {featuredMovie && (
            <div className="mb-8 hidden sm:block">
              <Link to={`/details/${featuredMovie.id}`} className="block">
                <div
                  className="relative bg-gray-800 rounded-md overflow-hidden mx-auto sm:h-80 sm:w-full md:h-64 md:w-full lg:h-80 lg:w-full xl:h-96 xl:w-full"
                  style={{ height: "800px", width: "100%" }}
                >
                  <img
                    src="/assets/shawshank.webp"
                    alt={featuredMovie.title}
                    className="absolute inset-0 w-full h-full object-cover opacity-60"
                  />
                  <div className="absolute inset-0 bg-black bg-opacity-40 flex flex-col justify-center items-center">
                    <h2 className="text-white text-4xl font-bold text-center">
                      {featuredMovie.title}
                    </h2>
                    {/* <p className="text-white text-lg mb-4 text-center">
                      {featuredMovie.genres.join(", ")}
                    </p> */}
                    <p className="text-yellow-500 text-xl font-semibold text-center">
                      Rating: {featuredMovie.rating}
                    </p>
                  </div>
                </div>
              </Link>
            </div>
          )}

          <Filter
            genre={genre}
            setGenre={setGenre}
            year={year}
            setYear={setYear}
            status={status}
            setStatus={setStatus}
            handleSubmit={handleSubmit}
            sortOrder={sortOrder}
            setSortOrder={setSortOrder}
          />
          <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-16 mt-10 mb-10">
            {currentMovies.map((movie) => (
              <Link to={`/details/${movie.id}`} key={movie.id}>
                <h3 className="text-white text-sm font-bold mb-1 text-center">
                  {movie.title}
                </h3>
                {/* <p className="text-white text-xs mb-1 text-center">
                  {movie.genres.join(", ")}
                </p> */}
                <p className="text-yellow-500 text-xs font-semibold text-center">
                  Rating: {movie.rating}
                </p>
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
                      className="px-3 py-1 bg-gray-700 text-white rounded hover:bg-gray-600"
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
