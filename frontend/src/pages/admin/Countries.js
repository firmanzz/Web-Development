import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";
import Cookies from "js-cookie"; // Import js-cookie untuk mengambil token

const Countries = ({ movies }) => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [newCountry, setNewCountry] = useState("");
  const [countries, setCountries] = useState([]);
  const [error, setError] = useState("");
  const [editingCountryId, setEditingCountryId] = useState(null);
  const [editingCountryName, setEditingCountryName] = useState("");

  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [countriesPerPage] = useState(10); // Limit countries per page
  const maxPageNumbers = 3; // Maximum number of page buttons to show at once

  useEffect(() => {
    const fetchCountries = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("https://master-movie-cms.vercel.app/api/countries", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });
        if (!response.ok) {
          throw new Error("Failed to fetch countries");
        }
        const data = await response.json();
        setCountries(data);
      } catch (error) {
        console.error("Error fetching countries:", error);
        setError("Failed to fetch countries");
      }
    };

    fetchCountries();
  }, []);

  const handleSubmit = async () => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch("https://master-movie-cms.vercel.app/api/addCountries", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
        body: JSON.stringify({ name: newCountry }),
      });

      const data = await response.json();

      if (!response.ok) {
        console.log("Error response:", data);

        if (data.error === "Country name already exists") {
          setError("Country name already exists");
        } else {
          setError(data.message || "Failed to add country");
        }

        throw new Error(data.message || "Failed to add country");
      }

      setCountries([...countries, data]);
      setNewCountry("");
      setError("");
    } catch (error) {
      console.error("Error adding country:", error);
    }
  };

  const handleDelete = async (id) => {
    const confirmDelete = window.confirm(
      "Are you sure you want to delete this country?"
    );
    if (!confirmDelete) {
      return;
    }

    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch(
        `https://master-movie-cms.vercel.app/api/countries/${id}`,
        {
          method: "DELETE",
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        }
      );

      if (response.ok) {
        setCountries((prevCountries) =>
          prevCountries.filter((country) => country.id !== id)
        );
        alert("Country deleted successfully.");
      } else {
        alert("Failed to delete country.");
      }
    } catch (error) {
      console.error("Error deleting country:", error);
      alert("Error deleting country.");
    }
  };

  const startEditing = (id, name) => {
    setEditingCountryId(id);
    setEditingCountryName(name);
  };

  const handleEditSubmit = async () => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch(
        `https://master-movie-cms.vercel.app/api/countries/${editingCountryId}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
          body: JSON.stringify({ name: editingCountryName }),
        }
      );

      if (!response.ok) {
        throw new Error("Failed to edit country");
      }

      const updatedCountry = await response.json();

      setCountries((prevCountries) =>
        prevCountries.map((country) =>
          country.id === editingCountryId ? updatedCountry : country
        )
      );

      setEditingCountryId(null);
      setEditingCountryName("");
    } catch (error) {
      console.error("Error editing country:", error);
      setError("Failed to edit country");
    }
  };

  const handleCancelEdit = () => {
    setEditingCountryId(null);
    setEditingCountryName("");
  };

  // Pagination Logic
  const indexOfLastCountry = currentPage * countriesPerPage;
  const indexOfFirstCountry = indexOfLastCountry - countriesPerPage;
  const currentCountries = countries.slice(
    indexOfFirstCountry,
    indexOfLastCountry
  );
  const totalPages = Math.ceil(countries.length / countriesPerPage);

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
          <h1 className="text-3xl md:text-4xl font-bold mb-4">Countries</h1>

          {error && <p className="text-red-600 mb-4">{error}</p>}

          <div className="mb-6">
            <div className="flex space-x-4">
              <input
                type="text"
                className="form-control border rounded-md px-4 py-2"
                placeholder="Country"
                value={newCountry}
                onChange={(e) => setNewCountry(e.target.value)}
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
                    Country
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
                {currentCountries.map((country, index) => (
                  <tr key={country.id}>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {indexOfFirstCountry + index + 1}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {editingCountryId === country.id ? (
                        <input
                          type="text"
                          value={editingCountryName}
                          onChange={(e) =>
                            setEditingCountryName(e.target.value)
                          }
                          className="border rounded-md px-2 py-1"
                        />
                      ) : (
                        country.name
                      )}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {country.movieCount || 0} {/* Default to 0 if null */}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {editingCountryId === country.id ? (
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
                            onClick={() =>
                              startEditing(country.id, country.name)
                            }
                            className="bg-yellow-600 text-white px-3 py-1 rounded-md mr-2"
                          >
                            Edit
                          </button>
                          <button
                            onClick={() => handleDelete(country.id)}
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

export default Countries;
