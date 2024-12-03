import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";
import Cookies from "js-cookie";

const Comments = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [comments, setComments] = useState([]);
  const [filteredComments, setFilteredComments] = useState([]);
  const [loading, setLoading] = useState(true);
  const [statusFilter, setStatusFilter] = useState("");
  const [showCount, setShowCount] = useState(10);
  const [searchTerm, setSearchTerm] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [selectedComments, setSelectedComments] = useState([]);
  const maxPageNumbers = 3;

  const fetchComments = async () => {
    setLoading(true);
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch("http://master-movie-cms.vercel.app/api/comments", {
        headers: {
          Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
      });
      const data = await response.json();
      setComments(data);
      setFilteredComments(data);
    } catch (error) {
      console.error("Error fetching comments:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchComments();
  }, []);

  // Filter comments, update status, and delete functions
  const handleCheckboxChange = (id) => {
    setSelectedComments((prevSelected) =>
      prevSelected.includes(id)
        ? prevSelected.filter((commentId) => commentId !== id)
        : [...prevSelected, id]
    );
  };

  const handleStatusFilter = (e) => {
    const value = e.target.value;
    setStatusFilter(value);
    setCurrentPage(1);
    filterComments(value, searchTerm);
  };

  const handleSearchChange = (e) => {
    const value = e.target.value;
    setSearchTerm(value);
    filterComments(statusFilter, value);
  };

  const filterComments = (status, search) => {
    let filtered = comments;
    if (status) {
      filtered = filtered.filter((comment) => comment.status === status);
    }
    if (search) {
      filtered = filtered.filter((comment) =>
        comment.comment.toLowerCase().includes(search.toLowerCase())
      );
    }
    setFilteredComments(filtered);
  };

  const handleStatusToggle = async () => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      await Promise.all(
        selectedComments.map(async (id) => {
          const comment = comments.find((c) => c.id === id);
          const newStatus =
            comment.status === "Approved" ? "Unapproved" : "Approved";
          const response = await fetch(
            `http://master-movie-cms.vercel.app/api/comments/${id}`,
            {
              method: "PUT",
              headers: {
                "Content-Type": "application/json",
                Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
              },
              body: JSON.stringify({ status: newStatus }),
            }
          );
          if (response.ok) {
            fetchComments(); // Refresh data
          }
        })
      );
      setSelectedComments([]);
    } catch (error) {
      console.error("Error updating status:", error);
      alert("Failed to update comment status.");
    }
  };

  const handleDelete = async () => {
    const confirmDelete = window.confirm(
      "Are you sure you want to delete the selected comments?"
    );
    if (!confirmDelete) return;

    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      await Promise.all(
        selectedComments.map(async (id) => {
          const response = await fetch(
            `http://master-movie-cms.vercel.app/api/comments/${id}`,
            {
              method: "DELETE",
              headers: {
                Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
              },
            }
          );
          if (response.ok) {
            fetchComments(); // Refresh data
          }
        })
      );
      setSelectedComments([]);
    } catch (error) {
      console.error("Error deleting comments:", error);
      alert("Failed to delete comments.");
    }
  };

  const handleShowCountChange = (e) => {
    setShowCount(parseInt(e.target.value));
    setCurrentPage(1);
  };

  const totalPages = Math.ceil(filteredComments.length / showCount);
  const currentComments = filteredComments.slice(
    (currentPage - 1) * showCount,
    currentPage * showCount
  );

  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-2xl font-bold mb-6">Comments</h1>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div>
              <label htmlFor="filterStatus" className="block mb-1">
                Filter by:
              </label>
              <select
                id="filterStatus"
                value={statusFilter}
                onChange={handleStatusFilter}
                className="w-full p-2 border border-gray-300 rounded"
              >
                <option value="">None</option>
                <option value="Unapproved">Unapproved</option>
                <option value="Approved">Approved</option>
              </select>
            </div>

            <div>
              <label htmlFor="showCount" className="block mb-1">
                Show
              </label>
              <select
                id="showCount"
                value={showCount}
                onChange={handleShowCountChange}
                className="w-full p-2 border border-gray-300 rounded"
              >
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100</option>
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
                onChange={handleSearchChange}
              />
            </div>
          </div>

          <div className="overflow-x-auto">
            {loading ? (
              <p>Loading comments...</p>
            ) : currentComments.length > 0 ? (
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-800 text-white">
                  <tr>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      <input
                        type="checkbox"
                        onChange={(e) =>
                          setSelectedComments(
                            e.target.checked
                              ? currentComments.map((comment) => comment.id)
                              : []
                          )
                        }
                        checked={
                          selectedComments.length === currentComments.length
                        }
                      />
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Username
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Rate
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Drama
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Comments
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Status
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Time
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {currentComments.map((comment) => (
                    <tr key={comment.id}>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <input
                          type="checkbox"
                          checked={selectedComments.includes(comment.id)}
                          onChange={() => handleCheckboxChange(comment.id)}
                        />
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {comment.User ? comment.User.name : "Unknown User"}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {comment.rate}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {comment.Movie ? comment.Movie.title : "Unknown Movie"}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {comment.comment}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {comment.status}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {new Date(comment.time).toLocaleString()}{" "}
                        {/* Display time */}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            ) : (
              <p>No comments available</p>
            )}
          </div>

          <div className="flex justify-between my-4">
            <div>
              <button
                onClick={handleStatusToggle}
                className="bg-blue-500 text-white px-4 py-2 rounded mr-2"
              >
                Approve/Unapprove
              </button>
              <button
                onClick={handleDelete}
                className="bg-red-600 text-white px-4 py-2 rounded"
              >
                Delete
              </button>
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
    </div>
  );
};

export default Comments;
