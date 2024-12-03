import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import SearchBar from "../components/SearchBar";
import Filter from "../components/Filter";
import Cookies from "js-cookie"; // Import js-cookie untuk mengambil token

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
  const maxPageNumbers = 3;

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("http://http://localhost:5000/api/movies", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });

        if (!response.ok) {
          throw new Error(`Failed to fetch movies: ${response.statusText}`);
        }

        const data = await response.json();
        const approvedMovies = data.filter(
          (movie) => movie.approvalstatus === true
        );

        setMovies(approvedMovies);
        setFilteredMovies(approvedMovies);
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

    // Search Logic
    if (searchQuery) {
      const lowerCaseQuery = searchQuery.toLowerCase();
      filtered = filtered.filter((movie) => {
        return (
          movie.title.toLowerCase().includes(lowerCaseQuery) ||
          (movie.Genres &&
            movie.Genres.some((g) =>
              g.name.toLowerCase().includes(lowerCaseQuery)
            )) ||
          (movie.Availabilities &&
            movie.Availabilities.some((avail) =>
              avail.name.toLowerCase().includes(lowerCaseQuery)
            )) ||
          (movie.Awards &&
            movie.Awards.some((a) =>
              a.award.toLowerCase().includes(lowerCaseQuery)
            ))
        );
      });
    }

    // Apply Genre Filter
    if (genre) {
      filtered = filtered.filter(
        (movie) => movie.Genres && movie.Genres.some((g) => g.name === genre)
      );
    }

    // Apply Award Filter
    if (award) {
      filtered = filtered.filter(
        (movie) => movie.Awards && movie.Awards.some((a) => a.award === award)
      );
    }

    // Apply Availability Filter
    if (availability) {
      filtered = filtered.filter((movie) =>
        movie.Availabilities.some((avail) => avail.name === availability)
      );
    }

    // Apply Year Filter
    if (year) {
      filtered = filtered.filter(
        (movie) => new Date(movie.releasedate).getFullYear().toString() === year
      );
    }

    // Apply Status Filter
    if (status) {
      filtered = filtered.filter((movie) => movie.status === status);
    }

    setFilteredMovies(filtered);
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

  const indexOfLastMovie = currentPage * moviesPerPage;
  const indexOfFirstMovie = indexOfLastMovie - moviesPerPage;
  const currentMovies = handleSort(filteredMovies, sortOrder).slice(
    indexOfFirstMovie,
    indexOfLastMovie
  );

  const paginate = (pageNumber) => setCurrentPage(pageNumber);
  const totalPages = Math.ceil(filteredMovies.length / moviesPerPage);

  // Calculate dynamic pagination
  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  return (
    <div className="container mx-auto">
      <div className="flex justify-center my-4">
        <SearchBar
          searchQuery={searchQuery}
          setSearchQuery={setSearchQuery}
          handleSearchSubmit={handleSubmit}
        />
      </div>
      {loading ? (
        <p className="text-white text-center">Loading movies...</p>
      ) : error ? (
        <p className="text-red-500 text-center">{error}</p>
      ) : (
        <>
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
                    className="h-72 w-64 object-cover rounded-md mb-2"
                  />
                  <h3 className="text-white text-sm font-bold mb-1">
                    {movie.title}
                  </h3>
                  <p className="text-white text-sm font-semibold">
                    {movie.Genres.map((genre) => genre.name).join(", ")}
                  </p>
                  <p className="text-yellow-500 text-xs font-semibold">
                    Rating: {movie.rating}
                  </p>
                </div>
              </Link>
            ))}
          </div>
          <div className="flex justify-center my-4 mb-14  ">
            <nav className="flex items-center space-x-2">
              {/* Previous Button */}
              <button
                onClick={() => paginate(currentPage - 1)}
                disabled={currentPage === 1}
                className={`px-3 py-1 bg-gray-700 text-white rounded ${
                  currentPage === 1
                    ? "opacity-50 cursor-not-allowed"
                    : "hover:bg-gray-600"
                }`}
              >
                &larr; Prev
              </button>

              {/* Page Numbers */}
              {startPage > 1 && (
                <>
                  <button
                    onClick={() => paginate(1)}
                    className={`px-3 py-1 bg-gray-700 text-white rounded ${
                      currentPage === 1 ? "bg-blue-500" : "hover:bg-gray-600"
                    }`}
                  >
                    1
                  </button>
                  {startPage > 2 && (
                    <span className="px-3 py-1 bg-gray-200 text-gray-500 rounded">
                      ...
                    </span>
                  )}
                </>
              )}

              {Array.from({ length: endPage - startPage + 1 }, (_, i) => (
                <button
                  key={startPage + i}
                  onClick={() => paginate(startPage + i)}
                  className={`px-3 py-1 bg-gray-700 text-white rounded ${
                    currentPage === startPage + i
                      ? "bg-blue-500"
                      : "hover:bg-gray-600"
                  }`}
                >
                  {startPage + i}
                </button>
              ))}

              {endPage < totalPages - 1 && (
                <span className="px-3 py-1 bg-gray-200 text-gray-500 rounded">
                  ...
                </span>
              )}

              {endPage < totalPages && (
                <button
                  onClick={() => paginate(totalPages)}
                  className={`px-3 py-1 bg-gray-700 text-white rounded ${
                    currentPage === totalPages
                      ? "bg-blue-500"
                      : "hover:bg-gray-600"
                  }`}
                >
                  {totalPages}
                </button>
              )}

              {/* Next Button */}
              <button
                onClick={() => paginate(currentPage + 1)}
                disabled={currentPage === totalPages}
                className={`px-3 py-1 bg-gray-700 text-white rounded ${
                  currentPage === totalPages
                    ? "opacity-50 cursor-not-allowed"
                    : "hover:bg-gray-600"
                }`}
              >
                Next &rarr;
              </button>
            </nav>
          </div>
        </>
      )}
    </div>
  );
};

export default MovieList;
