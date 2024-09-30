import React, { useState, useEffect, useRef } from "react";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const Actors = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);
  const [directors, setDirectors] = useState([]);
  const [formState, setFormState] = useState({
    directorName: '',
    country: '',
    birthDate: '',
    photo: null
  });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const fetchDirectors = async () => {
      try {
        const response = await fetch("http://localhost:5000/api/directors");
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

    fetchDirectors();
  }, []);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormState((prevState) => ({
      ...prevState,
      [name]: value
    }));
  };

  const handleFileChange = (e) => {
    setFormState((prevState) => ({
      ...prevState,
      photo: e.target.files[0]
    }));
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    const formData = new FormData();
    formData.append("actorName", formState.actorName);
    formData.append("countryid", formState.country); // Assuming you are using countryid in the form
    formData.append("birthdate", formState.birthDate);
    formData.append("photo", formState.photo);

    try {
      const response = await fetch("http://localhost:5000/api/actors", {
        method: "POST",
        body: formData
      });
      if (!response.ok) {
        throw new Error("Failed to add actor");
      }
      const newActor = await response.json();
      setDirectors([...directors, newActor]); // Add new actor to the list
      setFormState({ actorName: '', country: '', birthDate: '', photo: null }); // Reset form
    } catch (error) {
      console.error("Error adding actor:", error);
      setError("Failed to add actor. Please try again.");
    }
  };

  const handleDeleteActor = async (id) => {
    try {
      const response = await fetch(`http://localhost:5000/api/actors/${id}`, {
        method: "DELETE"
      });
      if (!response.ok) {
        throw new Error("Failed to delete actor");
      }
      setDirectors(directors.filter((actor) => actor.id !== id)); // Remove deleted actor from list
    } catch (error) {
      console.error("Error deleting actor:", error);
      setError("Failed to delete actor. Please try again.");
    }
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-1 p-4">
          <h1 className="text-2xl font-bold mb-6">Directors</h1>

          <div className="mb-6">
            <form
              onSubmit={handleSubmit}
              className="grid grid-cols-1 md:grid-cols-4 gap-4"
            >
              <div>
                <label
                  htmlFor="actorName"
                  className="block text-sm font-medium text-gray-700"
                >
                  Director Name
                </label>
                <input
                  type="text"
                  id="actorName"
                  name="actorName"
                  value={formState.actorName}
                  onChange={handleChange}
                  className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm"
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
                  value={formState.country}
                  onChange={handleChange}
                  className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm"
                />
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
                  className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm"
                />
              </div>
              <div>
                <label
                  htmlFor="photo"
                  className="block text-sm font-medium text-gray-700"
                >
                  Photo
                </label>
                <input
                  type="file"
                  id="photo"
                  name="photo"
                  onChange={handleFileChange}
                  className="form-control mt-1 block w-full bg-gray-300 rounded-md shadow-sm"
                />
              </div>
              <div className="md:col-span-4">
                <button
                  type="submit"
                  className="bg-blue-500 text-white px-4 py-2 rounded-md"
                >
                  Add Actor
                </button>
              </div>
            </form>
          </div>

          {/* Table for Displaying Actors */}
          <div className="overflow-x-auto">
            {loading ? (
              <p>Loading actors...</p>
            ) : error ? (
              <p className="text-red-500">{error}</p>
            ) : (
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
                      Director Name
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Birth Date
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Photos
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium uppercase tracking-wider">
                      Action
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {directors.map((director, index) => (
                    <tr key={director.id}>
                      <td className="px-6 py-4 whitespace-nowrap">{index + 1}</td>
                      <td className="px-6 py-4 whitespace-nowrap">{director.Country.name}</td>
                      <td className="px-6 py-4 whitespace-nowrap">{director.name}</td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        {new Date(director.birthdate).toLocaleDateString()}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <img
                          src={`http://localhost:5000/uploads/${director.urlphoto}`}
                          alt={director.name}
                          className="h-16 w-16 object-cover rounded-md"
                        />
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap">
                        <button
                          onClick={() => handleDeleteActor(director.id)}
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
        </div>
      </div>
    </div>
  );
};

export default Actors;
