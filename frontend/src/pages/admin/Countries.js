import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Countries = ({ movies }) => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [newCountry, setNewCountry] = useState("");
  const [countryList, setCountryList] = useState(movies);

  const addCountry = () => {
    if (newCountry.trim() === "") return;
    // Add logic to submit new country
    // For example, update the state with new country
    setCountryList([...countryList, { country: newCountry, _id: Date.now() }]);
    setNewCountry("");
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-4">Countries</h1>

          <div className="mb-6">
            <div className="flex space-x-4">
              <input
                type="text"
                className="form-control border rounded-md px-4 py-2"
                placeholder="Genre"
                value={newCountry}
                onChange={(e) => setNewCountry(e.target.value)}
              />
              <button
                className="bg-green-600 text-white px-4 py-2 rounded-md"
                onClick={addCountry}
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

export default Countries;
