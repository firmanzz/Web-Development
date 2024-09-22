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
  const navigate = useNavigate();

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
    .filter(
      (movie) => movie.title.toLowerCase().includes(searchTerm.toLowerCase()) // Search by title
    )
    .filter(
      (movie) => filterStatus === "All" || movie.approvalstatus === filterStatus // Filter by status
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
                Filtered by:
              </label>
              <select
                id="filterStatus"
                className="w-full p-2 border border-gray-300 rounded"
                value={filterStatus}
                onChange={(e) => setFilterStatus(e.target.value)}
              >
                <option value="All">All</option>
                <option value="Unapproved">Pending</option>
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
                onChange={(e) => setShowCount(Number(e.target.value))} // Convert to number
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
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[100px]">
                    Status
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base w-[100px]">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody>
                {currentMovies.map((movie, index) => (
                  <tr key={movie.id}>
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
                    <td className="px-6 py-4 whitespace-normal break-words text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.approvalstatus ? "Approved" : "Pending"}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      <button
                        onClick={() => handleEdit(movie.id)}
                        className="bg-blue-500 text-white px-3 py-1 rounded-md mr-2"
                      >
                        Edit
                      </button>
                      <button
                        onClick={() => handleDelete(movie.id)}
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

          {/* Pagination */}
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
        </main>
      </div>
    </div>
  );
};

export default MovieListCMS;
