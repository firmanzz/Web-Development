import React, { useState, useEffect, useRef } from "react";
import { useNavigate } from "react-router-dom";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const MovieListCMS = () => {
  const [open, setOpen] = useState(false);
  const [movies, setMovies] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterStatus, setFilterStatus] = useState("All");
  const [showCount, setShowCount] = useState(10);
  const [currentPage, setCurrentPage] = useState(1);
  const [expanded, setExpanded] = useState({});
  const sidebarRef = useRef(null);
  const [selectedMovie, setSelectedMovie] = useState(null);
  const navigate = useNavigate();
  const maxPageNumbers = 3; // Number of pagination buttons to show at once

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/movies");
        const data = await response.json();
        setMovies(data);
      } catch (error) {
        console.error("Error fetching movies:", error);
      }
    };

    fetchMovies();
  }, []);

  const handleDelete = async (id) => {
    const confirmDelete = window.confirm(
      "Are you sure you want to delete this movie?"
    );
    if (!confirmDelete) {
      return;
    }

    try {
      const response = await fetch(`http://localhost:5000/api/movies/${id}`, {
        method: "DELETE",
      });

      if (response.ok) {
        setMovies((prevMovies) =>
          prevMovies.filter((movie) => movie.id !== id)
        );
        alert("Movie deleted successfully.");
      } else {
        alert("Failed to delete movie.");
      }
    } catch (error) {
      console.error("Error deleting movie:", error);
      alert("Error deleting movie.");
    }
  };

  const handleEdit = (id) => {
    navigate(`/admin/editMovie/${id}`);
  };

  // Toggle the expanded synopsis
  const toggleReadMore = (id) => {
    setExpanded((prevState) => ({
      ...prevState,
      [id]: !prevState[id],
    }));
  };

  // Truncate long descriptions
  const truncateDescription = (description, limit = 100) => {
    if (description.length <= limit) {
      return description;
    }
    return description.slice(0, limit) + "...";
  };

  // Format text for items such as actors or genres
  const formatText = (items, limit = 3) => {
    if (!items || items.length === 0) return "";
    if (items.length > limit) {
      return (
        items.slice(0, limit).join(", ") + "\n" + items.slice(limit).join(", ")
      );
    }
    return items.join(", ");
  };

  // Filtering movies based on the search term and status
  const filteredMovies = movies
    .filter((movie) => {
      const searchString = `
      ${movie.title.toLowerCase()} 
      ${movie.synopsis ? movie.synopsis.toLowerCase() : ""}
      ${
        movie.Actors
          ? movie.Actors.map((actor) => actor.name.toLowerCase()).join(" ")
          : ""
      }
      ${
        movie.Genres
          ? movie.Genres.map((genre) => genre.name.toLowerCase()).join(" ")
          : ""
      }
    `;
      return searchString.includes(searchTerm.toLowerCase());
    })
    .filter(
      (movie) =>
        filterStatus === "All" ||
        (movie.approvalstatus ? "Approved" : "Pending") === filterStatus
    );

  // Pagination logic
  const indexOfLastMovie = currentPage * showCount;
  const indexOfFirstMovie = indexOfLastMovie - showCount;
  const currentMovies = filteredMovies.slice(
    indexOfFirstMovie,
    indexOfLastMovie
  );

  const totalPages = Math.ceil(filteredMovies.length / showCount);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  const handleSelectMovie = (movie) => {
    setSelectedMovie(movie);
  };

  const handleApproveToggle = async () => {
    if (!selectedMovie) return;

    const updatedStatus = !selectedMovie.approvalstatus;

    try {
      const response = await fetch(
        `http://localhost:5000/api/movies/${selectedMovie.id}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ approvalstatus: updatedStatus }),
        }
      );

      if (response.ok) {
        setMovies((prevMovies) =>
          prevMovies.map((movie) =>
            movie.id === selectedMovie.id
              ? { ...movie, approvalstatus: updatedStatus }
              : movie
          )
        );
        setSelectedMovie(null); // Close the modal
        alert("Movie status updated successfully.");
      } else {
        const errorData = await response.json();
        console.error("Error updating status:", errorData);
        alert("Failed to update movie status.");
      }
    } catch (error) {
      console.error("Error updating movie status:", error);
      alert("Error updating movie status.");
    }
  };

  const handleCloseModal = () => {
    setSelectedMovie(null);
  };

  // Calculate dynamic pagination
  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />

        <main className="flex-col flex-grow overflow-y-auto bg-white px-4 md:px-6 mt-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-4">Movies</h1>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mb-4">
            <div>
              <label className="block mb-1" htmlFor="filterStatus">
                Filter by:
              </label>
              <select
                id="filterStatus"
                className="w-full p-2 border border-gray-300 rounded"
                value={filterStatus}
                onChange={(e) => setFilterStatus(e.target.value)}
              >
                <option value="All">All</option>
                <option value="Pending">Pending</option>
                <option value="Approved">Approved</option>
              </select>
            </div>
            <div>
              <label className="block mb-1" htmlFor="showCount">
                Show
              </label>
              <select
                id="showCount"
                className="w-full p-2 border border-gray-300 rounded"
                value={showCount}
                onChange={(e) => setShowCount(Number(e.target.value))}
              >
                <option value={10}>10</option>
                <option value={20}>20</option>
                <option value={50}>50</option>
                <option value={100}>100</option>
              </select>
            </div>
            <div>
              <label className="block mb-1" htmlFor="searchBar">
                Search by title...
              </label>
              <input
                type="text"
                id="searchBar"
                className="w-full p-2 border border-gray-300 rounded"
                placeholder="Search by title..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
              />
            </div>
          </div>

          {/* Movie List */}
          <div className="overflow-x-auto">
            <table className="min-w-full table-auto bg-white">
              <thead className="bg-gray-800 text-white">
                <tr>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[50px]">
                    No
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[200px]">
                    Title
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[150px]">
                    Actors
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[150px]">
                    Genres
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[300px]">
                    Description
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[300px]">
                    Photos
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[100px]">
                    Status
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[100px]">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {currentMovies.map((movie, index) => (
                  <tr
                    key={movie.id}
                    onClick={() => handleSelectMovie(movie)}
                    className="cursor-pointer"
                  >
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base font-medium text-gray-900">
                      {indexOfFirstMovie + index + 1}
                    </td>
                    <td className="px-6 py-4 whitespace-normal break-words text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.title}
                    </td>
                    <td className="px-6 py-4 whitespace-normal break-words text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.Actors
                        ? formatText(movie.Actors.map((actor) => actor.name))
                        : "No Actors"}
                    </td>
                    <td className="px-6 py-4 whitespace-normal break-words text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.Genres
                        ? formatText(movie.Genres.map((genre) => genre.name))
                        : "No Genres"}
                    </td>
                    <td className="px-6 py-4 text-xs sm:text-sm md:text-base text-gray-500 whitespace-normal break-words">
                      {expanded[movie.id]
                        ? movie.synopsis
                        : truncateDescription(movie.synopsis, 100)}
                      {movie.synopsis.length > 100 && (
                        <button
                          onClick={() => toggleReadMore(movie.id)}
                          className="text-blue-500 ml-2"
                        >
                          {expanded[movie.id] ? "Read Less" : "Read More"}
                        </button>
                      )}
                    </td>
                    <td className="px-6 py-4 text-center">
                      <div className="flex justify-center items-center">
                        <img
                          src={movie.urlphoto}
                          alt={movie.title}
                          className="h-auto md:w-32 object-cover rounded-md"
                        />
                      </div>
                    </td>
                    <td className="px-6 py-4 whitespace-normal break-words text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.approvalstatus ? (
                        <span className="text-green-500">Approved</span>
                      ) : (
                        <span className="text-red-500">Unapproved</span>
                      )}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      <button
                        onClick={(e) => {
                          e.stopPropagation(); // Menghentikan event bubbling untuk mencegah modal terbuka
                          handleEdit(movie.id);
                        }}
                        className="bg-blue-500 text-white px-3 py-1 rounded-md mr-2"
                      >
                        Edit
                      </button>
                      <button
                        onClick={(e) => {
                          e.stopPropagation(); // Menghentikan event bubbling untuk mencegah modal terbuka
                          handleDelete(movie.id);
                        }}
                        className="bg-red-600 text-white px-3 py-1 rounded-md"
                      >
                        Delete
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <div className="flex justify-center my-4">
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

          {selectedMovie && (
            <div className="fixed inset-0 bg-gray-600 bg-opacity-50 flex justify-center items-center">
              <div className="bg-white p-6 rounded-lg w-full max-w-2xl max-h-[85vh] overflow-y-auto mt-12 md:mt-16 mx-4">
                <h2 className="text-2xl font-bold mb-4">
                  {selectedMovie.title}
                </h2>

                {/* Movie Details */}
                <p>
                  <strong>Alternative Title:</strong>{" "}
                  {selectedMovie.alternativetitle || "N/A"}
                </p>
                <p>
                  <strong>Synopsis:</strong> {selectedMovie.synopsis}
                </p>
                <p>
                  <strong>Photos:</strong>
                  <img
                    src={selectedMovie.urlphoto}
                    alt={selectedMovie.title}
                    className="h-46 w-36 object-cover rounded-md"
                  />
                </p>
                <p>
                  <strong>Release Date:</strong>{" "}
                  {selectedMovie.releasedate
                    ? new Date(selectedMovie.releasedate).toDateString()
                    : "N/A"}
                </p>
                <p>
                  <strong>Trailer Link:</strong>{" "}
                  <a
                    href={selectedMovie.linktrailer}
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    Watch Trailer
                  </a>
                </p>
                <p>
                  <strong>Rating:</strong> {selectedMovie.rating || "N/A"}
                </p>
                <p>
                  <strong>Duration:</strong>{" "}
                  {selectedMovie.duration
                    ? `${selectedMovie.duration} mins`
                    : "N/A"}
                </p>
                <p>
                  <strong>Status:</strong> {selectedMovie.status || "N/A"}
                </p>
                <p>
                  <strong>Approval Status:</strong>{" "}
                  {selectedMovie.approvalstatus ? "Approved" : "Pending"}
                </p>
                <p>
                  <strong>Country:</strong>{" "}
                  {selectedMovie.Country ? selectedMovie.Country.name : "N/A"}
                </p>

                <p>
                  <strong>Directors:</strong>{" "}
                  {selectedMovie.Directors && selectedMovie.Directors.length > 0
                    ? formatText(
                        selectedMovie.Directors.map((director) => director.name)
                      )
                    : "No Directors Listed"}
                </p>

                <p>
                  <strong>Actors:</strong>{" "}
                  {selectedMovie.Actors && selectedMovie.Actors.length > 0
                    ? formatText(
                        selectedMovie.Actors.map((actor) => actor.name)
                      )
                    : "No Actors Listed"}
                </p>

                <p>
                  <strong>Genres:</strong>{" "}
                  {selectedMovie.Genres && selectedMovie.Genres.length > 0
                    ? formatText(
                        selectedMovie.Genres.map((genre) => genre.name)
                      )
                    : "No Genres Listed"}
                </p>

                <p>
                  <strong>Awards:</strong>{" "}
                  {selectedMovie.Awards && selectedMovie.Awards.length > 0
                    ? formatText(
                        selectedMovie.Awards.map((award) => award.award)
                      )
                    : "No Awards Listed"}
                </p>

                <p>
                  <strong>Availability:</strong>{" "}
                  {selectedMovie.Availabilities &&
                  selectedMovie.Availabilities.length > 0
                    ? formatText(
                        selectedMovie.Availabilities.map((avail) => avail.name)
                      )
                    : "No Availability Listed"}
                </p>

                <div className="mt-4 flex justify-between">
                  <button
                    onClick={handleApproveToggle}
                    className="bg-blue-500 text-white px-4 py-2 rounded"
                  >
                    {selectedMovie.approvalstatus ? "Unapprove" : "Approve"}
                  </button>
                  <button
                    onClick={handleCloseModal}
                    className="bg-gray-500 text-white px-4 py-2 rounded"
                  >
                    Close
                  </button>
                </div>
              </div>
            </div>
          )}
        </main>
      </div>
    </div>
  );
};

export default MovieListCMS;
