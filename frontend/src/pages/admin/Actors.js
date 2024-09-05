import React from 'react';
import Sidebar from './SidebarCMS'; // Ensure you have this component

const Actors = ({ movies }) => {
  const handleSubmit = (event) => {
    event.preventDefault();
    // Add form submission logic here
    console.log('Form submitted');
  };

  const handleDeleteMovie = (id) => {
    // Add logic to handle delete
    console.log('Deleting movie with id:', id);
  };

  return (
    <div className="flex h-screen">
      <Sidebar className="w-1/4 bg-gray-800 text-white" />
      <div className="flex-1 p-4">
        <h1 className="text-2xl font-bold mb-6">Actors</h1>

        {/* Form for Adding Actors */}
        <div className="mb-6">
          <form onSubmit={handleSubmit} className="grid grid-cols-1 md:grid-cols-4 gap-4">
            <div>
              <label htmlFor="actorName" className="block text-sm font-medium text-gray-700">Actor Name</label>
              <input type="text" id="actorName" name="actorName" className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm" />
            </div>
            <div>
              <label htmlFor="country" className="block text-sm font-medium text-gray-700">Country</label>
              <input type="text" id="country" name="country" className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm" />
            </div>
            <div>
              <label htmlFor="birthDate" className="block text-sm font-medium text-gray-700">Birth Date</label>
              <input type="date" id="birthDate" name="birthDate" className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm" />
            </div>
            <div>
              <label htmlFor="photo" className="block text-sm font-medium text-gray-700">Photo</label>
              <input type="file" id="photo" name="photo" className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm" />
            </div>
            <div className="md:col-span-4">
              <button type="submit" className="bg-blue-500 text-white px-4 py-2 rounded-md">Add Actor</button>
            </div>
          </form>
        </div>

        {/* Table for Displaying Actors */}
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-800 text-white">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">No</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Country</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Actor Name</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Birth Date</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Photos</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Action</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {/* Populate with actor data here */}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Actors;
