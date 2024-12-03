import React, { useState, useEffect } from "react";
import Cookies from "js-cookie";

const Filter = ({
  genre,
  setGenre,
  year,
  setYear,
  status,
  setStatus,
  availability,
  setAvailability,
  award,
  setAward,
  sortOrder,
  setSortOrder,
  handleSubmit,
}) => {
  const [filterData, setFilterData] = useState({
    genres: [],
    years: [],
    statuses: [],
    availabilities: [],
    awards: [],
  });
  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    const fetchFilterData = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("http://localhost:5000/api/filters", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });
        const data = await response.json();
        setFilterData(data);
      } catch (error) {
        console.error("Error fetching filter data:", error);
      }
    };

    fetchFilterData();
  }, []);

  return (
    <div className="flex flex-col space-y-4 mt-2 mb-2 px-4">
      <button
        className="flex justify-between items-center w-full p-4 bg-gray-700 text-white rounded"
        onClick={() => setIsOpen(!isOpen)}
      >
        <span className="text-xl font-semibold">Filter</span>
        <svg
          className={`w-6 h-6 transform transition-transform ${
            isOpen ? "rotate-180" : "rotate-0"
          }`}
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M19 9l-7 7-7-7"
          />
        </svg>
      </button>
      <div
        className={`transition-max-height duration-500 ease-in-out ${
          isOpen ? "max-h-screen" : "max-h-0 overflow-hidden"
        }`}
      >
        <div className="flex flex-col space-y-4 mt-2 mb-2 px-4">
          <div className="flex flex-col items-center mb-4">
            <div className="flex flex-col md:flex-row md:space-x-4 space-y-4 md:space-y-0 w-full max-w-4xl">
              {/* Genre Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={genre}
                  onChange={(e) => setGenre(e.target.value)}
                >
                  <option value="">All Genre</option>
                  {filterData?.genres?.map((g) => (
                    <option key={g.id} value={g.name}>
                      {g.name} ({g.movieCount || 0})
                    </option>
                  ))}
                </select>
              </div>

              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={year}
                  onChange={(e) => setYear(e.target.value)}
                >
                  <option value="">All Year</option>
                  {filterData?.years?.map((y) => (
                    <option key={y.year} value={y.year}>
                      {y.year} ({y.movieCount || 0})
                    </option>
                  ))}
                </select>
              </div>

              {/* Status Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={status}
                  onChange={(e) => setStatus(e.target.value)}
                >
                  <option value="">All Status</option>
                  {filterData?.statuses?.map((s) => (
                    <option key={s.status} value={s.status}>
                      {s.status} ({s.movieCount || 0})
                    </option>
                  ))}
                </select>
              </div>

              {/* Availability Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={availability}
                  onChange={(e) => setAvailability(e.target.value)}
                >
                  <option value="">All Availability</option>
                  {filterData?.availabilities?.map((a) => (
                    <option key={a.id} value={a.name}>
                      {a.name} ({a.movieCount || 0})
                    </option>
                  ))}
                </select>
              </div>

              {/* Award Filter */}
              <div className="flex flex-col w-full md:w-1/5">
                <select
                  className="p-2 bg-gray-200 rounded w-full"
                  value={award}
                  onChange={(e) => setAward(e.target.value)}
                >
                  <option value="">All Award</option>
                  {filterData?.awards?.map((award) => (
                    <option key={award.id} value={award.award}>
                      {award.award} ({award.movieCount || 0})
                    </option>
                  ))}
                </select>
              </div>
            </div>
            <button
              className="p-2 bg-blue-500 text-white rounded mx-auto block mt-5"
              onClick={handleSubmit}
            >
              Submit
            </button>
          </div>

          {/* Sorted by Section */}
          <div className="flex flex-col items-center">
            <div className="flex flex-col w-full md:w-1/5">
              <select
                className="p-2 bg-gray-200 rounded w-full"
                value={sortOrder}
                onChange={(e) => setSortOrder(e.target.value)}
              >
                <option value="" disabled hidden>
                  Sort By
                </option>
                <option value="title">Title</option>
                <option value="rating">Rating</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Filter;
