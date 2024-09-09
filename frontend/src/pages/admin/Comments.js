import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Comments = ({ comments }) => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const handleSearchComments = () => {
    // Add logic to handle search
    console.log("Searching comments");
  };

  const handleApproveComments = () => {
    // Add logic to handle approve
    console.log("Approving comments");
  };

  const handleDeleteComments = () => {
    // Add logic to handle delete
    console.log("Deleting comments");
  };

  const handleSelectAll = () => {
    // Add logic to handle select all
    console.log("Selecting all comments");
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-2xl font-bold mb-6">Comments</h1>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div>
              <label
                htmlFor="filterStatus"
                className="block text-sm font-medium text-gray-700"
              >
                Filtered by:
              </label>
              <select
                id="filterStatus"
                className="form-select block w-full mt-1"
              >
                <option>None</option>
                <option value="Unapproved">Unapproved</option>
                <option value="Approved">Approved</option>
              </select>
            </div>

            <div>
              <label
                htmlFor="showCount"
                className="block text-sm font-medium text-gray-700"
              >
                Shows
              </label>
              <select id="showCount" className="form-select block w-full mt-1">
                <option>10</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100</option>
              </select>
            </div>

            <div>
              <div className="flex space-x-4">
                <input
                  type="text"
                  id="searchBar"
                  className="form-control block w-full"
                  placeholder="Search..."
                />
                <button
                  onClick={handleSearchComments}
                  className="btn btn-outline-secondary"
                >
                  Search
                </button>
              </div>
            </div>
          </div>

          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-800 text-white">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    <input type="checkbox" onClick={handleSelectAll} />
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
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200"></tbody>
            </table>
          </div>

          <div className="flex space-x-4 mt-6">
            <button
              onClick={handleApproveComments}
              className="bg-green-600 text-white px-4 py-2 rounded-md"
            >
              Approve
            </button>
            <button
              onClick={handleDeleteComments}
              className="bg-red-600 text-white px-4 py-2 rounded-md"
            >
              Delete
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Comments;
