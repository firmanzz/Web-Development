import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Awards = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [awards, setAwards] = useState([]);
  const [countries, setCountries] = useState([]);
  const [newAward, setNewAward] = useState({
    awardName: "",
    year: "",
    country: "",
  });
  const [selectedAward, setSelectedAward] = useState(null);
  const [selectedCountry, setSelectedCountry] = useState(null);
  const [filteredCountries, setFilteredCountries] = useState([]);
  const [error, setError] = useState("");

  // Pagination State
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);
  const maxPageNumbers = 3;

  // Search & Filter State
  const [searchTerm, setSearchTerm] = useState("");
  const [filterCountry, setFilterCountry] = useState("All");

  useEffect(() => {
    const fetchAwards = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/awards");
        if (!response.ok) {
          throw new Error("Failed to fetch awards");
        }
        const data = await response.json();
        setAwards(data);
      } catch (error) {
        console.error("Error fetching awards:", error);
        setError("Failed to fetch awards");
      }
    };

    const fetchCountries = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/countries");
        const countryData = await response.json();
        setCountries(countryData);
      } catch (error) {
        console.error("Error fetching countries:", error);
      }
    };

    fetchAwards();
    fetchCountries();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setNewAward((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    const currentYear = new Date().getFullYear();

    if (parseInt(newAward.year) > currentYear) {
      setError("Year cannot be in the future.");
      return;
    }

    const formData = {
      award: newAward.awardName || selectedAward?.award,
      countryid:
        selectedCountry?.id || selectedAward?.Country?.id || newAward.country,
      year: newAward.year || selectedAward?.year,
    };

    try {
      let response;
      if (selectedAward) {
        response = await fetch(
          `http://localhost:5000/api/awards/${selectedAward.id}`,
          {
            method: "PUT",
            headers: {
              "Content-Type": "application/json",
            },
            body: JSON.stringify(formData),
          }
        );
      } else {
        response = await fetch("http://localhost:5000/api/addAward", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(formData),
        });
      }

      if (!response.ok) {
        throw new Error("Failed to save award");
      }

      const updatedAward = await response.json();

      if (selectedAward) {
        setAwards(
          awards.map((award) =>
            award.id === updatedAward.id ? updatedAward : award
          )
        );
      } else {
        setAwards([...awards, updatedAward]);
      }

      setNewAward({ awardName: "", year: "", country: "" });
      setSelectedCountry(null);
      setSelectedAward(null);
      setError(""); // Clear error on success
    } catch (error) {
      console.error("Error saving award:", error);
      setError("Failed to save award. Please try again.");
    }
  };

  const handleDeleteAward = async (id) => {
    try {
      const response = await fetch(`http://localhost:5000/api/awards/${id}`, {
        method: "DELETE",
      });
      if (!response.ok) {
        throw new Error("Failed to delete award");
      }
      setAwards(awards.filter((award) => award.id !== id));
    } catch (error) {
      console.error("Error deleting award:", error);
      setError("Failed to delete award. Please try again.");
    }
  };

  const handleCountryChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = countries.filter((country) =>
      country.name.toLowerCase().includes(query)
    );
    setFilteredCountries(filtered);
  };

  const handleCountrySelect = (country) => {
    setSelectedCountry(country);
    setFilteredCountries([]);
  };

  const handleCountryRemove = () => {
    setSelectedCountry(null);
  };

  const handleEditAward = (award) => {
    setSelectedAward(award);
    setNewAward({
      awardName: award.award,
      year: award.year,
      country: award.countryid,
    });
    setSelectedCountry(award.Country);
  };

  const handleCancelEdit = () => {
    setSelectedAward(null);
    setNewAward({ awardName: "", year: "", country: "" });
    setSelectedCountry(null);
  };

  // Filtering and searching awards
  const filteredAwards = awards.filter((award) => {
    const matchesCountry =
      filterCountry === "All" || award.Country?.name === filterCountry;
    const matchesSearch = award.award
      .toLowerCase()
      .includes(searchTerm.toLowerCase());
    return matchesCountry && matchesSearch;
  });

  // Pagination logic
  const indexOfLastAward = currentPage * itemsPerPage;
  const indexOfFirstAward = indexOfLastAward - itemsPerPage;
  const currentAwards = filteredAwards.slice(
    indexOfFirstAward,
    indexOfLastAward
  );

  const totalPages = Math.ceil(filteredAwards.length / itemsPerPage);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <main className="flex-col flex-grow overflow-y-auto bg-white px-4 md:px-6 mt-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-4">Awards</h1>

          <div className="mb-6">
            <form
              onSubmit={handleSubmit}
              className="grid grid-cols-1 md:grid-cols-4 gap-4"
            >
              <div>
                <label
                  htmlFor="awardName"
                  className="block text-sm font-medium text-gray-700"
                >
                  Award Name
                </label>
                <input
                  type="text"
                  id="awardName"
                  name="awardName"
                  value={newAward.awardName}
                  onChange={handleChange}
                  placeholder="Start typing award name..."
                  className="form-control mt-1 block w-full p-2 border border-gray-300 rounded"
                />
              </div>
              <div className="relative mb-4">
                <label
                  htmlFor="country"
                  className="block text-sm font-medium text-gray-700"
                >
                  Country
                </label>
                <input
                  type="text"
                  id="country"
                  name="country"
                  className="mt-1 block w-full p-2 border border-gray-300 rounded"
                  placeholder={
                    selectedCountry
                      ? selectedCountry.name
                      : "Start typing country..."
                  }
                  onChange={handleCountryChange}
                  value={selectedCountry ? selectedCountry.name : ""}
                />
                <div
                  className={`absolute z-10 bg-white shadow-md rounded-md mt-1 w-full ${
                    filteredCountries.length === 0 ? "hidden" : ""
                  }`}
                >
                  {filteredCountries.map((country) => (
                    <div
                      key={country.id}
                      className="p-2 hover:bg-gray-200 cursor-pointer"
                      onClick={() => handleCountrySelect(country)}
                    >
                      {country.name}
                    </div>
                  ))}
                </div>
                {selectedCountry && (
                  <button
                    onClick={handleCountryRemove}
                    className="mt-2 text-sm text-red-600 hover:text-red-800"
                  >
                    Remove Country
                  </button>
                )}
              </div>
              <div>
                <label
                  htmlFor="year"
                  className="block text-sm font-medium text-gray-700"
                >
                  Year
                </label>
                <input
                  type="number"
                  id="year"
                  name="year"
                  value={newAward.year}
                  onChange={handleChange}
                  className="form-control mt-1 block w-full p-2 border border-gray-300 rounded"
                />
              </div>

              <div className="md:col-span-4">
                <button
                  type="submit"
                  className="bg-blue-500 text-white px-4 py-2 rounded-md"
                >
                  {selectedAward ? "Update Award" : "Add Award"}
                </button>
                {selectedAward && (
                  <button
                    type="button"
                    onClick={handleCancelEdit}
                    className="bg-red-500 text-white px-4 py-2 rounded-md ml-4"
                  >
                    Cancel Edit
                  </button>
                )}
              </div>
            </form>
          </div>

          {/* Filter and Search Section */}
          <div className="mb-6 grid grid-cols-1 md:grid-cols-3 gap-4">
            <div>
              <label
                htmlFor="filterCountry"
                className="block text-sm font-medium text-gray-700"
              >
                Filter by Country:
              </label>
              <select
                id="filterCountry"
                value={filterCountry}
                onChange={(e) => setFilterCountry(e.target.value)}
                className="w-full p-2 border border-gray-300 rounded"
              >
                <option value="All">All</option>
                {countries.map((country) => (
                  <option key={country.id} value={country.name}>
                    {country.name}
                  </option>
                ))}
              </select>
            </div>
            <div>
              <label
                htmlFor="itemsPerPage"
                className="block text-sm font-medium text-gray-700"
              >
                Show
              </label>
              <select
                id="itemsPerPage"
                value={itemsPerPage}
                onChange={(e) => setItemsPerPage(Number(e.target.value))}
                className="w-full p-2 border border-gray-300 rounded"
              >
                <option value={10}>10</option>
                <option value={20}>20</option>
                <option value={50}>50</option>
              </select>
            </div>
            <div>
              <label
                htmlFor="search"
                className="block text-sm font-medium text-gray-700"
              >
                Search by Award Name
              </label>
              <input
                type="text"
                id="search"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full p-2 border border-gray-300 rounded"
                placeholder="Search by name..."
              />
            </div>
          </div>

          {/* Table for Displaying Filtered and Searched Awards */}
          <div className="overflow-x-auto">
            {error ? (
              <p className="text-red-500">{error}</p>
            ) : (
              <table className="min-w-full divide-y divide-gray-200 text-sm md:text-base">
                <thead className="bg-gray-800 text-white">
                  <tr>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      No
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Award Name
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Country
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Year
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Action
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {currentAwards.map((award, index) => (
                    <tr key={award.id}>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {indexOfFirstAward + index + 1}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {award.award}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {award.Country ? award.Country.name : "No Country"}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {award.year}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <button
                          onClick={() => handleEditAward(award)}
                          className="text-blue-600 hover:text-blue-800 mr-4"
                        >
                          Edit
                        </button>
                        <button
                          onClick={() => handleDeleteAward(award.id)}
                          className="text-red-600 hover:text-red-800"
                        >
                          Delete
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
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
        </main>
      </div>
    </div>
  );
};

export default Awards;
