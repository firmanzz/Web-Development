import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Countries = ({ movies }) => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [newCountry, setNewCountry] = useState("");
  const [countries, setCountries] = useState([]);
  const [error, setError] = useState("");

  useEffect(() => {
    const fetchCountries = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/countries");
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
      const response = await fetch("http://localhost:5000/api/addCountries", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ name: newCountry }),
      });

      const data = await response.json();

      if (!response.ok) {
        console.log("Error response:", data);
        throw new Error(data.message || "Failed to add country");
      }

      setCountries([...countries, data]);
      setNewCountry("");
    } catch (error) {
      console.error("Error adding country:", error);
      setError("Failed to add country");
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
      const response = await fetch(
        `http://localhost:5000/api/countries/${id}`,
        {
          method: "DELETE",
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
                    Action
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {countries.map((country, index) => (
                  <tr key={country.id}>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {index + 1}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      {country.name}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                      <button
                        onClick={() => handleDelete(country.id)}
                        className="bg-red-600 text-white px-3 py-1 rounded-md"
                      >
                        Delete
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Countries;
