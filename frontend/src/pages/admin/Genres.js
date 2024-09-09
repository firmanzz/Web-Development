import React, { useState, useEffect } from 'react';
import Sidebar from './SidebarCMS'; // Ensure you have this component

const Genres = () => {
  const [genres, setGenres] = useState([]);
  const [newGenre, setNewGenre] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchGenres = async () => {
      try {
        const response = await fetch(
          "http://localhost:5000/api/genres"
        );
        const data = await response.json();
        setGenres(data);
      } catch (error) {
        console.error("Error fetching genres:", error);
      }
    };

    fetchGenres();
  }, []);


  return (
    <div className="flex h-screen">
      <Sidebar className="w-1/4 bg-gray-800 text-white" />
      <div className="flex-1 p-4">
        <h1 className="text-2xl font-bold mb-6">Genres</h1>

        {error && <p className="text-red-600 mb-4">{error}</p>}
        
        <div className="mb-6">
          <div className="flex space-x-4">
            <input
              type="text"
              className="form-control border rounded-md px-4 py-2"
              placeholder="Genre"
              value={newGenre}
              onChange={(e) => setNewGenre(e.target.value)}
            />
            <button
              className="bg-green-600 text-white px-4 py-2 rounded-md"
            >
              Submit
            </button>
          </div>
        </div>
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-800 text-white">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">No</th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Genre</th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Action</th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {genres.map((genre, index) => (
                  <tr key={genre._id}>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{index + 1}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{genre.name}</td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      <button
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
      </div>
    </div>
  );
};

export default Genres;
