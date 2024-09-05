import React from 'react';
import { Link } from 'react-router-dom';

const Sidebar = () => {
  return (
    <div className="bg-gray-800 text-white w-64 min-h-screen p-5 flex flex-col">
      <div className="mb-8">
        <h1 className="text-2xl font-bold">MasterMovie Admin</h1>
      </div>
      <ul className="space-y-4">
        <li className="group">
          <button className="w-full text-left text-lg font-medium group-hover:bg-gray-700 p-2 rounded">
            Movies
          </button>
          <ul className="pl-4 space-y-2 hidden group-hover:block">
            <li>
              <Link to="/admin" className="block text-base text-white hover:underline">
                Validate
              </Link>
            </li>
            <li>
              <Link to="/admin/addMovie" className="block text-base text-white hover:underline">
                Input New Movie
              </Link>
            </li>
          </ul>
        </li>
        <li>
          <Link to="/admin/countries" className="block text-lg font-medium hover:bg-gray-700 p-2 rounded">
            Countries
          </Link>
        </li>
        <li>
          <Link to="/admin/awards" className="block text-lg font-medium hover:bg-gray-700 p-2 rounded">
            Awards
          </Link>
        </li>
        <li>
          <Link to="/admin/genres" className="block text-lg font-medium hover:bg-gray-700 p-2 rounded">
            Genres
          </Link>
        </li>
        <li>
          <Link to="/admin/actors" className="block text-lg font-medium hover:bg-gray-700 p-2 rounded">
            Actors
          </Link>
        </li>
        <li>
          <Link to="/admin/comments" className="block text-lg font-medium hover:bg-gray-700 p-2 rounded">
            Comments
          </Link>
        </li>
        <li>
          <Link to="/admin/users" className="block text-lg font-medium hover:bg-gray-700 p-2 rounded">
            Users
          </Link>
        </li>
        <li>
          <button className="w-full text-left text-lg font-medium hover:bg-gray-700 p-2 rounded">
            Logout
          </button>
        </li>
      </ul>
    </div>
  );
};

export default Sidebar;
