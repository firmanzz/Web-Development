import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const MovieListCMS = () => {
  const [open, setOpen] = useState(false);
  const [movies, setMovies] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterStatus, setFilterStatus] = useState("All");
  const [showCount, setShowCount] = useState(10);
  const sidebarRef = useRef(null);

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
                <option value="Unapproved">Unapproved</option>
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
                onChange={(e) => setShowCount(e.target.value)}
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

          {/* Movie List: Responsif dengan overflow */}
          <div className="overflow-x-auto">
            <table className="min-w-full table-auto bg-white">
              <thead className="bg-gray-800 text-white">
                <tr>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base">
                    No
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base">
                    Title
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base">
                    Actors
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base">
                    Genres
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base">
                    Description
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base">
                    Status
                  </th>
                  <th className="text-center p-3 text-xs sm:text-sm md:text-base">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody>
                {movies.map((movie, index) => (
                  <tr key={movie.id}>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base font-medium text-gray-900">
                      {index + 1}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.title}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      {/* Handle actors here */}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.Genres
                        ? movie.Genres.map((genre) => genre.name).join(", ")
                        : "No Genres"}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.synopsis}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      {movie.statusedit}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                      <button className="bg-red-600 text-white px-3 py-1 rounded-md">
                        Delete
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>
  );
};

export default MovieListCMS;
