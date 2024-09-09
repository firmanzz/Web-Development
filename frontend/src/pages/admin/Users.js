import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Users = ({ users }) => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const handleSubmit = (event) => {
    event.preventDefault();
    // Add form submission logic here
    console.log("Form submitted");
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-2xl font-bold mb-6">Users</h1>

          <div className="mb-6">
            <form
              onSubmit={handleSubmit}
              className="grid grid-cols-1 md:grid-cols-4 gap-4"
            >
              <div>
                <label
                  htmlFor="name"
                  className="block text-sm font-medium text-gray-700"
                >
                  Name
                </label>
                <input
                  type="text"
                  id="name"
                  name="name"
                  className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm"
                />
              </div>
              <div>
                <label
                  htmlFor="email"
                  className="block text-sm font-medium text-gray-700"
                >
                  Email
                </label>
                <input
                  type="email"
                  id="email"
                  name="email"
                  className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm"
                />
              </div>
              <div>
                <label
                  htmlFor="role"
                  className="block text-sm font-medium text-gray-700"
                >
                  Role
                </label>
                <select
                  id="role"
                  name="role"
                  className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm"
                >
                  <option value="">Select a role</option>
                  <option value="admin">Admin</option>
                  <option value="user">User</option>
                  <option value="guest">Guest</option>
                </select>
              </div>
              <div className="md:col-span-4">
                <button
                  type="submit"
                  className="bg-blue-500 text-white px-4 py-2 rounded-md"
                >
                  Add User
                </button>
              </div>
            </form>
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
                    Email
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Role
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                    Action
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200"></tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Users;
