import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";
import Cookies from "js-cookie";

const Directors = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [directors, setDirectors] = useState([]);
  const [formState, setFormState] = useState({
    directorName: "",
    country: "",
    birthDate: "",
    photo: "",
  });
  const [filteredCountries, setFilteredCountries] = useState([]);
  const [selectedCountry, setSelectedCountry] = useState(null);
  const [countries, setCountries] = useState([]);
  const [selectedDirector, setSelectedDirector] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  // State for filter, search, pagination, and item per page
  const [searchTerm, setSearchTerm] = useState("");
  const [filterCountry, setFilterCountry] = useState("All");
  const [currentPage, setCurrentPage] = useState(1);
  const [itemsPerPage, setItemsPerPage] = useState(10);
  // eslint-disable-next-line no-unused-vars
  const maxPageNumbers = 3

  useEffect(() => {
    const fetchDirectors = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("http://localhost:5000/api/directors", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });
        if (!response.ok) {
          throw new Error(`Failed to fetch directors: ${response.statusText}`);
        }
        const data = await response.json();
        setDirectors(data);
        setLoading(false);
      } catch (error) {
        console.error("Error fetching directors:", error);
        setError("Failed to load directors. Please try again later.");
        setLoading(false);
      }
    };

    const fetchCountries = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("http://localhost:5000/api/countries", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });
        const countryData = await response.json();
        setCountries(countryData);
      } catch (error) {
        console.error("Error fetching countries:", error);
      }
    };

    fetchDirectors();
    fetchCountries();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormState((prevState) => ({
      ...prevState,
      [name]: value,
    }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    const birthDateObj = new Date(formState.birthDate);
    if (birthDateObj > new Date()) {
      setError("Birthdate cannot be in the future.");
      return;
    }

    const formData = {
      name: formState.directorName || selectedDirector?.name,
      countryid: selectedCountry?.id || selectedDirector?.Country?.id || formState.country,
      birthdate: formState.birthDate || selectedDirector?.birthdate,
      urlphoto: formState.photo || selectedDirector?.urlphoto,
    };

    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      let response;
      if (selectedDirector) {
      response = await fetch(`http://localhost:5000/api/directors/${selectedDirector.id}`, {
        method: "PUT",
        headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
        body: JSON.stringify(formData),
      });
      } else {
      response = await fetch("http://localhost:5000/api/addDirector", {
        method: "POST",
        headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
        body: JSON.stringify(formData),
      });
      }

      if (!response.ok) {
        throw new Error("Failed to save director");
      }

      const updatedDirector = await response.json();

      if (selectedDirector) {
        setDirectors(directors.map((director) => (director.id === updatedDirector.id ? updatedDirector : director)));
      } else {
        setDirectors([...directors, updatedDirector]);
      }

      setFormState({ directorName: "", country: "", birthDate: "", photo: "" });
      setSelectedCountry(null);
      setSelectedDirector(null);
    } catch (error) {
      console.error("Error saving director:", error);
      setError("Failed to save director. Please try again.");
    }
  };

  const handleDeleteDirector = async (id) => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      const response = await fetch(`http://localhost:5000/api/directors/${id}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
        },
      });
      if (!response.ok) {
        throw new Error("Failed to delete director");
      }
      setDirectors(directors.filter((director) => director.id !== id));
    } catch (error) {
      console.error("Error deleting director:", error);
      setError("Failed to delete director. Please try again.");
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

  const handleEditDirector = (director) => {
    setSelectedDirector(director);

    const formattedBirthDate = new Date(director.birthdate).toISOString().split('T')[0];

    setFormState({
      directorName: director.name,
      birthDate: formattedBirthDate,
      photo: director.urlphoto,
      country: director.countryid,
    });
    setSelectedCountry(director.Country);
  };

  const handleCancelEdit = () => {
    setSelectedDirector(null);
    setFormState({ directorName: "", country: "", birthDate: "", photo: "" });
    setSelectedCountry(null);
  };

  // Filtering and searching directors
  const filteredDirectors = directors.filter((director) => {
    const matchesCountry = filterCountry === "All" || director.Country?.name === filterCountry;
    const matchesSearch = director.name.toLowerCase().includes(searchTerm.toLowerCase());
    return matchesCountry && matchesSearch;
  });

  // Pagination logic
  const indexOfLastDirector = currentPage * itemsPerPage;
  const indexOfFirstDirector = indexOfLastDirector - itemsPerPage;
  const currentDirectors = filteredDirectors.slice(indexOfFirstDirector, indexOfLastDirector);

  const totalPages = Math.ceil(filteredDirectors.length / itemsPerPage);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  // Calculate page numbers for dynamic pagination
  const startPage = Math.max(1, currentPage - Math.floor(maxPageNumbers / 2));
  const endPage = Math.min(totalPages, startPage + maxPageNumbers - 1);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <main className="flex-col flex-grow overflow-y-auto bg-white px-4 md:px-6 mt-4">
        <h1 className="text-3xl md:text-4xl font-bold mb-4">Directors</h1>

          <div className="mb-6">
            <form
              onSubmit={handleSubmit}
              className="grid grid-cols-1 md:grid-cols-4 gap-4"
            >
              <div>
                <label
                  htmlFor="directorName"
                  className="block text-sm font-medium text-gray-700"
                >
                  Director Name
                </label>
                <input
                  type="text"
                  id="directorName"
                  name="directorName"
                  value={formState.directorName}
                  onChange={handleChange}
                  placeholder="Start typing director name..."
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
                  htmlFor="birthDate"
                  className="block text-sm font-medium text-gray-700"
                >
                  Birth Date
                </label>
                <input
                  type="date"
                  id="birthDate"
                  name="birthDate"
                  value={formState.birthDate}
                  onChange={handleChange}
                  className="form-control mt-1 block w-full p-2 border border-gray-300 rounded"
                />
              </div>
              <div>
                <label
                  htmlFor="photo"
                  className="block text-sm font-medium text-gray-700"
                >
                  Photo URL
                </label>
                <input
                  type="text"
                  id="photo"
                  name="photo"
                  value={formState.photo}
                  onChange={handleChange}
                  className="form-control mt-1 block w-full p-2 border border-gray-300 rounded"
                  placeholder="Start typing photo url..."
                />
              </div>

              <div className="md:col-span-4">
                <button
                  type="submit"
                  className="bg-blue-500 text-white px-4 py-2 rounded-md"
                >
                  {selectedDirector ? "Update Director" : "Add Director"}
                </button>
                {selectedDirector && (
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
              <label htmlFor="filterCountry" className="block text-sm font-medium text-gray-700">
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
              <label htmlFor="itemsPerPage" className="block text-sm font-medium text-gray-700">
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
              <label htmlFor="search" className="block text-sm font-medium text-gray-700">
                Search by Director Name
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

          {/* Table for Displaying Filtered and Searched Directors */}
          <div className="overflow-x-auto">
            {loading ? (
              <p>Loading directors...</p>
            ) : error ? (
              <p className="text-red-500">{error}</p>
            ) : (
              <table className="min-w-full divide-y divide-gray-200 text-sm md:text-base">
                <thead className="bg-gray-800 text-white">
                  <tr>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      No
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Director Name
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Country
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Birth Date
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Photos
                    </th>
                    <th className="px-6 py-3 text-left font-medium uppercase tracking-wider">
                      Action
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {currentDirectors.map((director, index) => (
                    <tr key={director.id}>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {indexOfFirstDirector + index + 1}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {director.name}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {director.Country ? director.Country.name : "No Country"}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {new Date(director.birthdate).toLocaleDateString()}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <img
                          src={director.urlphoto}
                          alt={director.name}
                          className="h-16 w-16 object-cover rounded-md"
                        />
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <button
                          onClick={() => handleEditDirector(director)}
                          className="text-blue-600 hover:text-blue-800 mr-4"
                        >
                          Edit
                        </button>
                        <button
                          onClick={() => handleDeleteDirector(director.id)}
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

export default Directors;
