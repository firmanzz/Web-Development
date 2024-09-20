import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Genres = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [genres, setGenres] = useState([]);
  const [newGenre, setNewGenre] = useState("");
  const [error, setError] = useState("");

  useEffect(() => {
    const fetchGenres = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/genres");
        if (!response.ok) {
          throw new Error("Failed to fetch genres");
        }
        const data = await response.json();
        setGenres(data);
      } catch (error) {
        console.error("Error fetching genres:", error);
        setError("Failed to fetch genres");
      }
    };

    fetchGenres();
  }, []);

  const handleSubmit = async () => {
    try {
      const response = await fetch("http://localhost:5000/api/addGenres", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ name: newGenre }),
      });

      const data = await response.json();

      if (!response.ok) {
        console.log("Error response:", data); // Log error dari response jika ada
        throw new Error(data.message || "Failed to add genre");
      }

      setGenres([...genres, data]);
      setNewGenre(""); 
    } catch (error) {
      console.error("Error adding genre:", error);
      setError("Failed to add genre");
    }
  };

  const handleDelete = async (id) => {
    const confirmDelete = window.confirm(
      "Are you sure you want to delete this genre?"
    );
    if (!confirmDelete) {
      return;
    }

    try {
      const response = await fetch(`http://localhost:5000/api/genres/${id}`, {
        method: "DELETE",
      });

      if (response.ok) {
        setGenres((prevGenres) =>
          prevGenres.filter((genre) => genre.id !== id)
        );
        alert("Genre deleted successfully.");
      } else {
        alert("Failed to delete genre.");
      }
    } catch (error) {
      console.error("Error deleting genre:", error);
      alert("Error deleting genre.");
    }
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
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
                onClick={handleSubmit}
              >
                Submit
              </button>
            </div>
          </div>
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-800 text-white">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    No
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Genre
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {genres.map((genre, index) => (
                  <tr key={genre.id}>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {index + 1}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {genre.name}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      <button
                        onClick={() => handleDelete(genre.id)}
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
    </div>
  );
};

export default Genres;
