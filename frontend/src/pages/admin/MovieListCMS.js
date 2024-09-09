import React, { useState, useEffect } from "react";
import Sidebar from "./SidebarCMS";

const MovieListCMS = () => {
  const [movies, setMovies] = useState([]);
  const [searchTerm, setSearchTerm] = useState("");
  const [filterStatus, setFilterStatus] = useState("All");
  const [showCount, setShowCount] = useState(10);

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
    <div className="flex h-screen">
      {/* Sidebar: Lebar disesuaikan untuk layar yang lebih kecil */}
      <Sidebar className="w-full sm:w-1/2 md:w-1/4 bg-gray-800 text-white" />

      <main className="flex-grow p-4 bg-gray-100">
        <h1 className="text-3xl md:text-4xl font-bold mb-4">Movies</h1>

        {/* Filter Section: Responsif dengan grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mb-4">
          <div>
            <label className="block mb-1" htmlFor="filterStatus">
              Filtered by :
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
          <table className="min-w-full bg-white">
            <thead className="bg-gray-800 text-white">
              <tr>
                <th className="text-center p-3 text-xs sm:text-sm md:text-base">No</th>
                <th className="text-center p-3 text-xs sm:text-sm md:text-base">Title</th>
                <th className="text-center p-3 text-xs sm:text-sm md:text-base">Actors</th>
                <th className="text-center p-3 text-xs sm:text-sm md:text-base">Genres</th>
                <th className="text-center p-3 text-xs sm:text-sm md:text-base">Description</th>
                <th className="text-center p-3 text-xs sm:text-sm md:text-base">Status</th>
                <th className="text-center p-3 text-xs sm:text-sm md:text-base">Action</th>
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
                    {movie.genres ? movie.genres.map((genre) => genre.name).join(", ") : "No Genres"}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                    {movie.synopsis}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-xs sm:text-sm md:text-base text-gray-500">
                    {movie.status}
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
  );
};

export default MovieListCMS;
