import React, { useState } from 'react';
import Sidebar from './SidebarCMS'; // Ensure you have this component

const Awards = ({ awards }) => {
  const [formState, setFormState] = useState({
    country: '',
    year: '',
    awardName: '',
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormState((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Add logic to handle form submission
    // For example, you could make an API call here
  };

  const editAward = (id) => {
    // Redirect to edit page or handle edit logic
    window.location.href = `/awards/edit/${id}`;
  };

  const deleteAward = (id) => {
    // Handle delete logic
    // For example, you could make an API call here
    console.log(`Deleting award with id: ${id}`);
  };

  return (
    <div className="flex h-screen">
      <Sidebar className="w-1/4 bg-gray-800 text-white" />
      <div className="flex-1 p-4">
        <h1 className="text-2xl font-bold mb-6">Awards</h1>

        <div className="mb-6">
          <form onSubmit={handleSubmit} className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="col-span-1">
              <label htmlFor="country" className="block text-lg font-medium text-gray-700">Country</label>
              <input
                type="text"
                id="country"
                name="country"
                value={formState.country}
                onChange={handleChange}
                className="mt-1 block w-full rounded-md bg-gray-300 shadow-sm"
                required
              />
            </div>
            <div className="col-span-1">
              <label htmlFor="year" className="block text-lg font-medium text-gray-700">Year</label>
              <input
                type="number"
                id="year"
                name="year"
                value={formState.year}
                onChange={handleChange}
                className="mt-1 block w-full rounded-md bg-gray-300 shadow-sm"
                required
              />
            </div>
            <div className="col-span-1">
              <label htmlFor="awardName" className="block text-lg font-medium text-gray-700">Award Name</label>
              <input
                type="text"
                id="awardName"
                name="awardName"
                value={formState.awardName}
                onChange={handleChange}
                className="mt-1 block w-full rounded-md bg-gray-300 shadow-sm"
                required
              />
            </div>
            <div className="col-span-3">
              <button type="submit" className="px-4 py-2 bg-green-600 text-white rounded-md">
                Submit
              </button>
            </div>
          </form>
        </div>

        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-800 text-white">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">No</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Country</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Year</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Award Name</th>
                <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">Actions</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};

export default Awards;
