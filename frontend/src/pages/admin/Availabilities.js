import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";
import Cookies from "js-cookie"; // Import js-cookie untuk mengambil token

const Availability = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [availabilities, setAvailabilities] = useState([]);
  const [newAvailability, setNewAvailability] = useState("");
  const [error, setError] = useState("");
  const [editingId, setEditingId] = useState(null);
  const [editingName, setEditingName] = useState("");

  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage] = useState(10);
  const maxPageNumbers = 3;

  useEffect(() => {
    const fetchAvailabilities = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("http://http://localhost:5000/api/avail", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });
        if (!response.ok) throw new Error("Failed to fetch availabilities");
        const data = await response.json();
        setAvailabilities(data);
      } catch (error) {
        console.error("Error fetching availabilities:", error);
        setError("Failed to fetch availabilities");
      }
    };

    fetchAvailabilities();
  }, []);

  const handleSubmit = async () => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch("http://http://localhost:5000/api/addAvail", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
        body: JSON.stringify({ name: newAvailability }),
      });

      const data = await response.json();

      if (!response.ok) {
        if (data.message === "Availability name already exists") {
          setError("Availability name already exists");
        } else {
          setError(data.message || "Failed to add availability");
        }
        throw new Error(data.message || "Failed to add availability");
      }

      setAvailabilities([...availabilities, data]);
      setNewAvailability("");
      setError("");
    } catch (error) {
      console.error("Error adding availability:", error);
    }
  };

  const handleDelete = async (id) => {
    if (!window.confirm("Are you sure you want to delete this availability?")) return;
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch(`http://http://localhost:5000/api/avail/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
      });
      if (response.ok) {
        setAvailabilities(availabilities.filter((item) => item.id !== id));
        alert("Availability deleted successfully.");
      } else {
        alert("Failed to delete availability.");
      }
    } catch (error) {
      console.error("Error deleting availability:", error);
      alert("Error deleting availability.");
    }
  };

  const startEditing = (id, name) => {
    setEditingId(id);
    setEditingName(name);
  };

  const handleEditSubmit = async () => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch(`http://http://localhost:5000/api/avail/${editingId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
        body: JSON.stringify({ name: editingName }),
      });
      if (!response.ok) throw new Error("Failed to edit availability");
      const updatedAvailability = await response.json();
      setAvailabilities(
        availabilities.map((item) =>
          item.id === editingId ? updatedAvailability : item
        )
      );
      setEditingId(null);
      setEditingName("");
    } catch (error) {
      console.error("Error editing availability:", error);
      setError("Failed to edit availability");
    }
  };

  const handleCancelEdit = () => {
    setEditingId(null);
    setEditingName("");
  };

  // Pagination Logic
  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = availabilities.slice(indexOfFirstItem, indexOfLastItem);
  const totalPages = Math.ceil(availabilities.length / itemsPerPage);
  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-6">Availability</h1>

          {error && <p className="text-red-600 mb-4">{error}</p>}

          <div className="mb-6">
            <div className="flex space-x-4">
              <input
                type="text"
                className="form-control border rounded-md px-4 py-2"
                placeholder="Availability"
                value={newAvailability}
                onChange={(e) => setNewAvailability(e.target.value)}
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
                    Name
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Usage
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {currentItems.map((item, index) => (
                  <tr key={item.id}>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {indexOfFirstItem + index + 1}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {editingId === item.id ? (
                        <input
                          type="text"
                          value={editingName}
                          onChange={(e) => setEditingName(e.target.value)}
                          className="border rounded-md px-2 py-1"
                        />
                      ) : (
                        item.name
                      )}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {item.usageCount}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {editingId === item.id ? (
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
                            onClick={() => startEditing(item.id, item.name)}
                            className="bg-yellow-600 text-white px-3 py-1 rounded-md mr-2"
                          >
                            Edit
                          </button>
                          <button
                            onClick={() => handleDelete(item.id)}
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
export default Availability;
