import React, { useState } from 'react';
import Sidebar from "./SidebarCMS";

const MovieListCMS = ({ movies }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const [filterStatus, setFilterStatus] = useState('All');
  const [showCount, setShowCount] = useState(10);

  return (
    <div className="flex h-screen">
      <Sidebar className="w-1/4 bg-gray-800 text-white" />

      <main className="flex-grow p-4 bg-gray-100">
        <h1 className="text-4xl font-bold mb-4">Movies</h1>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
          <div>
            <label className="block mb-1" htmlFor="filterStatus">Filtered by :</label>
            <select
              id="filterStatus"
              className="w-full p-2 border border-gray-300 rounded"
              value={filterStatus}
              onChange={e => setFilterStatus(e.target.value)}
            >
              <option value="All">All</option>
              <option value="Unapproved">Unapproved</option>
              <option value="Approved">Approved</option>
            </select>
          </div>
          <div>
            <label className="block mb-1" htmlFor="showCount">Show</label>
            <select
              id="showCount"
              className="w-full p-2 border border-gray-300 rounded"
              value={showCount}
              onChange={e => setShowCount(e.target.value)}
            >
              <option value={10}>10</option>
              <option value={20}>20</option>
              <option value={50}>50</option>
              <option value={100}>100</option>
            </select>
          </div>
          <div>
            <label className="block mb-1" htmlFor="searchBar">Search by title...</label>
            <input
              type="text"
              id="searchBar"
              className="w-full p-2 border border-gray-300 rounded"
              placeholder="Search by title..."
              value={searchTerm}
              onChange={e => setSearchTerm(e.target.value)}
            />
          </div>
        </div>

        <div className="overflow-x-auto">
          <table className="min-w-full bg-white">
            <thead>
              <tr>
                <th className="text-center p-3">No</th>
                <th className="text-center p-3">Drama</th>
                <th className="text-center p-3">Actors</th>
                <th className="text-center p-3">Genres</th>
                <th className="text-center p-3">Description</th>
                <th className="text-center p-3">Status</th>
                <th className="text-center p-3">Action</th>
              </tr>
            </thead>
            <tbody>
              {/* Render movies here */}
            </tbody>
          </table>
        </div>
      </main>
    </div>
  );
};

// const Description = ({ movieId, description }) => {
//   const [expanded, setExpanded] = useState(false);

//   return (
//     <div>
//       <p id={`description-${movieId}`} className={`overflow-hidden transition-all ${expanded ? 'max-h-full' : 'max-h-16'}`}>
//         {description}
//       </p>
//       <button
//         className="text-blue-500 mt-2"
//         onClick={() => setExpanded(!expanded)}
//       >
//         {expanded ? 'Read less' : 'Read more'}
//       </button>
//     </div>
//   );
// };

// const deleteMovie = async (movieId) => {
//   if (window.confirm('Are you sure you want to delete this movie?')) {
//     try {
//       const response = await fetch(`/api/movies/deleteMovie/${movieId}`, { method: 'DELETE' });
//       if (response.ok) {
//         document.getElementById(`movie-${movieId}`).remove();
//         alert('Movie deleted');
//       } else {
//         alert('Failed to delete the movie');
//       }
//     } catch (error) {
//       console.error('Error:', error);
//     }
//   }
// };

export default MovieListCMS;
