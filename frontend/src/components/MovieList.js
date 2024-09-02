import React, { useState, useEffect } from "react";
import SearchBar from "./SearchBar";
import Filter from "./Filter";
import { Link } from "react-router-dom";

const MovieList = () => {
  const [movies, setMovies] = useState([]);
  const [genre, setGenre] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [moviesPerPage] = useState(18);
  const [year, setYear] = useState("");
  const [status, setStatus] = useState("");
  const [sortOrder, setSortOrder] = useState(""); // State untuk sorting

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await fetch(
          "http://localhost:5001/api/movies/getAllMovies"
        );
        const data = await response.json();
        setMovies(data);
      } catch (error) {
        console.error("Error fetching movies:", error);
      }
    };

    fetchMovies();
  }, []);

  const handleSubmit = () => {
    // Implementasi filter logic berdasarkan genre, year, status di sini
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
  const currentMovies = handleSort(movies, sortOrder).slice(indexOfFirstMovie, indexOfLastMovie);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  const totalPages = Math.ceil(movies.length / moviesPerPage);

  return (
    <div className="container mx-auto px-4">
      <div className="flex justify-center my-4">
        <SearchBar />
      </div>
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
          <Link to={`/details/${movie._id}`} key={movie._id}>
            <img
              src="/assets/Movie1.jpg"
              alt={movie.title}
              className="w-full h- object-cover rounded-md mb-2"
            />
            <h3 className="text-white text-sm font-bold mb-1 text-center">
              {movie.title}
            </h3>
            <p className="text-white text-xs mb-1 text-center">
              {movie.genres.join(", ")}
            </p>
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
              <li key={i + 1} className={`mx-1 ${currentPage === i + 1 ? 'text-blue-500' : ''}`}>
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
    </div>
  );
};

export default MovieList;
