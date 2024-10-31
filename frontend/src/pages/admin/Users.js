import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Users = () => {
  const [open, setOpen] = useState(false);
  const [users, setUsers] = useState([]);
  const [openModal, setOpenModal] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null); // State untuk user yang dipilih
  const sidebarRef = useRef(null);
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;
  const maxPageNumbers = 3;

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/users");
        const data = await response.json();
        setUsers(data);
      } catch (error) {
        console.error("Error fetching users:", error);
      }
    };

    fetchUsers();
  }, []);

  const openEditModal = (user) => {
    setSelectedUser(user);
    setOpenModal(true);
  };

  const closeEditModal = () => {
    setSelectedUser(null);
    setOpenModal(false);
  };

  const handleSuspendToggle = async () => {
    if (!selectedUser) return;

    try {
      const updatedStatus = !selectedUser.suspend;

      await fetch(`http://localhost:5000/api/users/${selectedUser.id}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ suspend: updatedStatus }),
      });

      setUsers((prevUsers) =>
        prevUsers.map((user) =>
          user.id === selectedUser.id
            ? { ...user, suspend: updatedStatus }
            : user
        )
      );
      closeEditModal();
    } catch (error) {
      console.error("Error updating user suspend status:", error);
    }
  };

  const handleDelete = async (id) => {
    const confirmDelete = window.confirm(
      "Are you sure you want to delete this user?"
    );
    if (!confirmDelete) return;

    try {
      const response = await fetch(`http://localhost:5000/api/users/${id}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
        },
      });

      if (response.ok) {
        setUsers((prevUsers) => prevUsers.filter((user) => user.id !== id));
        alert("User deleted successfully.");
      } else {
        const errorData = await response.json();
        console.error("Error deleting user:", errorData.message);
        alert("Failed to delete user.");
      }
    } catch (error) {
      console.error("Error deleting user:", error);
      alert("An error occurred while trying to delete the user.");
    }
  };

  const totalPages = Math.ceil(users.length / itemsPerPage);
  const startIndex = (currentPage - 1) * itemsPerPage;
  const currentUsers = users.slice(startIndex, startIndex + itemsPerPage);

  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-2xl font-bold mb-6">Users</h1>

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
                    Email
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Role
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Status
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {currentUsers.map((user, index) => (
                  <tr key={user.id}>
                    <td className="px-6 py-4 whitespace-nowrap">{index + 1}</td>
                    <td className="px-6 py-4 whitespace-nowrap">{user.name}</td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      {user.email}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">{user.role}</td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      {user.suspend ? "Suspended" : "Active"}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <button
                        onClick={() => openEditModal(user)}
                        className="text-blue-500 hover:text-blue-700 mr-2"
                      >
                        Edit
                      </button>
                      <button
                        onClick={() => handleDelete(user.id)}
                        className="text-red-500 hover:text-red-700"
                      >
                        Delete
                      </button>
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

          {/* Modal */}
          {openModal && selectedUser && (
            <div className="fixed inset-0 bg-gray-600 bg-opacity-50 flex justify-center items-center">
              <div className="bg-white p-6 rounded-lg shadow-lg">
                <h2 className="text-xl font-bold mb-4">
                  Edit User Suspend Status
                </h2>
                <p className="mb-4">
                  Name:{" "}
                  <span className="font-semibold">{selectedUser.name}</span>
                </p>
                <p className="mb-4">
                  Email:{" "}
                  <span className="font-semibold">{selectedUser.email}</span>
                </p>
                <p className="mb-4">
                  Status:{" "}
                  <span className="font-semibold">
                    {selectedUser.suspend ? "Suspended" : "Active"}
                  </span>
                </p>
                <button
                  onClick={handleSuspendToggle}
                  className={`px-4 py-2 rounded-md ${
                    selectedUser.suspend ? "bg-green-500" : "bg-red-500"
                  } text-white`}
                >
                  {selectedUser.suspend ? "Activate User" : "Suspend User"}
                </button>
                <button
                  onClick={closeEditModal}
                  className="ml-4 px-4 py-2 rounded-md bg-gray-500 text-white"
                >
                  Cancel
                </button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default Users;
