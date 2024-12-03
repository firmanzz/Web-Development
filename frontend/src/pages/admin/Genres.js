import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";
import Cookies from "js-cookie";

const Genres = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [genres, setGenres] = useState([]);
  const [newGenre, setNewGenre] = useState("");
  const [error, setError] = useState("");
  const [editingGenreId, setEditingGenreId] = useState(null);
  const [editingGenreName, setEditingGenreName] = useState("");

  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [genresPerPage] = useState(10); // Limit genres per page
  const maxPageNumbers = 3; // Maximum number of page buttons to show at once

  useEffect(() => {
    const fetchGenres = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("http://http://localhost:5000/api/genres", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });
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
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch("http://http://localhost:5000/api/addGenres", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
        body: JSON.stringify({ name: newGenre }),
      });
  
      const data = await response.json();
  
      if (!response.ok) {
        console.log("Error response:", data);
  
        if (data.error === "Genre name already exists") {
          setError("Genre name already exists");
        } else {
          setError(data.message || "Failed to add genre");
        }
        
        throw new Error(data.message || "Failed to add genre");
      }
      setGenres([...genres, data]);
      setNewGenre("");
      setError(""); 
    } catch (error) {
      console.error("Error adding genre:", error);
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
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch(`http://http://localhost:5000/api/genres/${id}`, {
      method: "DELETE",
      headers: {
        Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
      },
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

    const startEditing = (id, name) => {
    setEditingGenreId(id);
    setEditingGenreName(name);
    };

    const handleEditSubmit = async () => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch(
      `http://http://localhost:5000/api/genres/${editingGenreId}`,
      {
        method: "PUT",
        headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
        body: JSON.stringify({ name: editingGenreName }),
      }
      );

      if (!response.ok) {
        throw new Error("Failed to edit genre");
      }

      const updatedGenre = await response.json();

      setGenres((prevGenres) =>
        prevGenres.map((genre) =>
          genre.id === editingGenreId ? updatedGenre : genre
        )
      );

      setEditingGenreId(null);
      setEditingGenreName("");
    } catch (error) {
      console.error("Error editing genre:", error);
      setError("Failed to edit genre");
    }
  };

  const handleCancelEdit = () => {
    setEditingGenreId(null);
    setEditingGenreName("");
  };

  // Pagination Logic
  const indexOfLastGenre = currentPage * genresPerPage;
  const indexOfFirstGenre = indexOfLastGenre - genresPerPage;
  const currentGenres = genres.slice(indexOfFirstGenre, indexOfLastGenre);
  const totalPages = Math.ceil(genres.length / genresPerPage);

  // Dynamic Pagination Logic
  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-6">Genres</h1>

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
                    Movies
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {currentGenres.map((genre, index) => (
                  <tr key={genre.id}>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {indexOfFirstGenre + index + 1}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {editingGenreId === genre.id ? (
                        <input
                          type="text"
                          value={editingGenreName}
                          onChange={(e) => setEditingGenreName(e.target.value)}
                          className="border rounded-md px-2 py-1"
                        />
                      ) : (
                        genre.name
                      )}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {genre.movieCount || 0} {/* Default to 0 if null */}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {editingGenreId === genre.id ? (
                        <>
                          <button
                            onClick={handleEditSubmit}
                            className="bg-blue-600 text-white px-3 py-1 rounded-md mr-2"
                          >
                            OK
                          </button>
                          <button
                            onClick={handleCancelEdit}
                            className="bg-gray-600 text-white px-3 py-1 rounded-md"
                          >
                            Cancel
                          </button>
                        </>
                      ) : (
                        <>
                          <button
                            onClick={() => startEditing(genre.id, genre.name)}
                            className="bg-yellow-600 text-white px-3 py-1 rounded-md mr-2"
                          >
                            Edit
                          </button>
                          <button
                            onClick={() => handleDelete(genre.id)}
                            className="bg-red-600 text-white px-3 py-1 rounded-md"
                          >
                            Delete
                          </button>
                        </>
                      )}
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
        </div>
      </div>
    </div>
  );
};

export default Genres;
