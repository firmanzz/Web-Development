import React, { useState } from "react";
import Sidebar from "./SidebarCMS";

const MovieForm = () => {
  const [actors, setActors] = useState([
    "Jason Statham",
    "Johnny Depp",
    "Gal Gadot",
    "Lukman Sardi",
    "Yayan Ruhiyan",
  ]);

  const handleRemoveActor = (actor) => {
    setActors(actors.filter((a) => a !== actor));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle form submission logic here
    console.log("Form submitted");
  };

  return (
    <div className="flex h-screen">
      <Sidebar className="w-1/4 bg-gray-800 text-white" />
      <div className="container mx-5 mt-4">
        <h1 className="text-2xl font-bold mb-6">Movie Form</h1>
        <form
          action="/movies/addMovie"
          method="POST"
          encType="multipart/form-data"
          onSubmit={handleSubmit}
        >
          <div className="grid grid-cols-2 gap-4 mb-4">
            <div>
              <label
                htmlFor="title"
                className="block text-sm font-medium text-gray-700"
              >
                Title
              </label>
              <input
                type="text"
                id="title"
                name="title"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
              />
            </div>
            <div>
              <label
                htmlFor="alternativeTitle"
                className="block text-sm font-medium text-gray-700"
              >
                Alternative Title
              </label>
              <input
                type="text"
                id="alternativeTitle"
                name="alternativeTitle"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
              />
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4 mb-4">
            <div>
              <label
                htmlFor="year"
                className="block text-sm font-medium text-gray-700"
              >
                Year
              </label>
              <input
                type="text"
                id="year"
                name="year"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
              />
            </div>
            <div>
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
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
              />
            </div>
          </div>

          <div className="mb-4">
            <label
              htmlFor="synopsis"
              className="block text-sm font-medium text-gray-700"
            >
              Synopsis
            </label>
            <textarea
              id="synopsis"
              name="synopsis"
              rows="3"
              className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
            ></textarea>
          </div>

          <div className="mb-4">
            <label
              htmlFor="availability"
              className="block text-sm font-medium text-gray-700"
            >
              Availability
            </label>
            <input
              type="text"
              id="availability"
              name="availability"
              className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
            />
          </div>

          <div className="mb-4">
            <label
              htmlFor="genres"
              className="block text-sm font-medium text-gray-700"
            >
              Add Genres
            </label>
            <div className="space-x-4">
              <div className="inline-flex items-center">
                <input
                  id="action"
                  type="checkbox"
                  value="Action"
                  name="genres"
                  className="form-checkbox"
                />
                <label htmlFor="action" className="ml-2">
                  Action
                </label>
              </div>
              <div className="inline-flex items-center">
                <input
                  id="romance"
                  type="checkbox"
                  value="Romance"
                  name="genres"
                  className="form-checkbox"
                />
                <label htmlFor="romance" className="ml-2">
                  Romance
                </label>
              </div>
              <div className="inline-flex items-center">
                <input
                  id="adventure"
                  type="checkbox"
                  value="Adventure"
                  name="genres"
                  className="form-checkbox"
                />
                <label htmlFor="adventure" className="ml-2">
                  Adventure
                </label>
              </div>
            </div>
          </div>

          <div className="mb-4">
            <label
              htmlFor="actors"
              className="block text-sm font-medium text-gray-700"
            >
              Add Actors
            </label>
            <input
              type="text"
              id="searchActor"
              placeholder="Search Actor Names"
              className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm mb-2"
            />
            <div className="space-y-2">
              {actors.map((actor) => (
                <div key={actor} className="flex items-center justify-between bg-gray-200 p-2 rounded-md">
                  <span>{actor}</span>
                  <button
                    type="button"
                    className="text-red-600"
                    onClick={() => handleRemoveActor(actor)}
                  >
                    Remove
                  </button>
                </div>
              ))}
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4 mb-4">
            <div>
              <label
                htmlFor="linkTrailer"
                className="block text-sm font-medium text-gray-700"
              >
                Link Trailer
              </label>
              <input
                type="text"
                id="linkTrailer"
                name="linkTrailer"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
              />
            </div>
            <div>
              <label
                htmlFor="award"
                className="block text-sm font-medium text-gray-700"
              >
                Award
              </label>
              <select
                id="award"
                name="award"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
              >
                <option value="">Select Award</option>
                {/* Add award options here */}
              </select>
            </div>
          </div>

          <div className="flex justify-end mt-4">
            <button
              type="submit"
              className="px-4 py-2 bg-green-600 text-white rounded-md mr-2"
            >
              Submit
            </button>
            <a href="/" className="px-4 py-2 bg-red-600 text-white rounded-md">
              Cancel
            </a>
          </div>
        </form>
      </div>
    </div>
  );
};

export default MovieForm;
