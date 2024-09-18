import React, { useState, useEffect, useRef } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const MovieForm = () => {
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);

  const [filteredGenres, setFilteredGenres] = useState([]);
  const [filteredAwards, setFilteredAwards] = useState([]);
  const [filteredActors, setFilteredActors] = useState([]);

  const [genres, setGenres] = useState([]);
  const [awards, setAwards] = useState([]);
  const [countries, setCountries] = useState([]);
  const [actors, setActors] = useState([]);

  const [selectedGenres, setSelectedGenres] = useState([]);
  const [selectedAwards, setSelectedAwards] = useState([]);
  const [selectedActors, setSelectedActors] = useState([]);

  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const genreResponse = await fetch("http://localhost:5000/api/genres");
        const genreData = await genreResponse.json();
        setGenres(genreData);

        const awardResponse = await fetch("http://localhost:5000/api/awards");
        const awardData = await awardResponse.json();
        setAwards(awardData);

        const countryResponse = await fetch("http://localhost:5000/api/countries");
        const countryData = await countryResponse.json();
        setCountries(countryData);

        const actorResponse = await fetch("http://localhost:5000/api/actors");
        const actorData = await actorResponse.json();
        setActors(actorData);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, []);

  const handleRemoveActor = (actor) => {
    setActors(actors.filter((a) => a !== actor));
  };

  const handleActorChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = actors.filter((actor) =>
      actor.name.toLowerCase().includes(query)
    );
    setFilteredActors(filtered);
  };

  const handleActorSelect = (actor) => {
    if (!selectedActors.includes(actor)) {
      setSelectedActors([...selectedActors, actor]);
    }
    setFilteredActors([]);
  };

  const handleGenreChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = genres.filter((genre) =>
      genre.name.toLowerCase().includes(query)
    );
    setFilteredGenres(filtered);
  };

  const handleAwardChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = awards.filter((award) =>
      award.award.toLowerCase().includes(query)
    );
    setFilteredAwards(filtered);
  };

  // Fungsi untuk menambahkan genre yang dipilih
  const handleGenreSelect = (genre) => {
    if (!selectedGenres.includes(genre)) {
      setSelectedGenres([...selectedGenres, genre]);
    }
    setFilteredGenres([]);
  };

  // Fungsi untuk menambahkan award yang dipilih
  const handleAwardSelect = (award) => {
    if (!selectedAwards.includes(award)) {
      setSelectedAwards([...selectedAwards, award]);
    }
    setFilteredAwards([]);
  };

  // Fungsi untuk menghapus genre yang dipilih
  const handleRemoveGenre = (genre) => {
    setSelectedGenres(selectedGenres.filter((g) => g.id !== genre.id));
  };

  // Fungsi untuk menghapus award yang dipilih
  const handleRemoveAward = (award) => {
    setSelectedAwards(selectedAwards.filter((a) => a.id !== award.id));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);

    selectedGenres.forEach((genre) => {
      formData.append("genres", genre.id);
    });
    selectedAwards.forEach((award) => {
      formData.append("awards", award.id);
    });
    selectedActors.forEach((actor) => {
      formData.append("actors", actor.id);
    });

    try {
      await axios.post("/movies/addMovie", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      console.log("Form submitted successfully");

      navigate("/admin/"); 
    } catch (error) {
      console.error("Error submitting form", error);
    }
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="container mb-10 mx-5 mt-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-4">Movie Form</h1>
          <form
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
                  Release Date
                </label>
                <input
                  type="date"
                  id="year"
                  name="releasedate"
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
                <select
                  id="country"
                  name="countryid"
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                >
                  <option value="">Select Country</option>
                  {countries.map((country) => (
                    <option key={country.id} value={country.id}>
                      {country.name}
                    </option>
                  ))}
                </select>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label
                  htmlFor="duration"
                  className="block text-sm font-medium text-gray-700"
                >
                  Duration
                </label>
                <input
                  type="text"
                  id="duration"
                  name="duration"
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
              <div>
                <label
                  htmlFor="status"
                  className="block text-sm font-medium text-gray-700"
                >
                  Status
                </label>
                <input
                  type="text"
                  id="status"
                  name="status"
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
            <div>
                <label
                  htmlFor="rating"
                  className="block text-sm font-medium text-gray-700"
                >
                  Rating
                </label>
                <input
                  type="text"
                  id="rating"
                  name="rating"
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
              <div>
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
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label
                  htmlFor="urlphoto"
                  className="block text-sm font-medium text-gray-700"
                >
                  URL Poster
                </label>
                <input
                  type="text"
                  id="urlphoto"
                  name="urlphoto"
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
              <div>
                <label
                  htmlFor="linktrailer"
                  className="block text-sm font-medium text-gray-700"
                >
                  Link Trailer
                </label>
                <input
                  type="text"
                  id="linktrailer"
                  name="linktrailer"
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

            {/* Genre Section */}
            <div className="mb-4">
              <label
                htmlFor="genres"
                className="block text-sm font-medium text-gray-700"
              >
                Add Genres
              </label>
              <input
                type="text"
                id="genres"
                name="genres"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                placeholder="Start typing genre..."
                onChange={handleGenreChange}
              />
              <div className="bg-white shadow-md rounded-md mt-2">
                {filteredGenres.map((genre) => (
                  <div
                    key={genre.id}
                    className="p-2 hover:bg-gray-200 cursor-pointer"
                    onClick={() => handleGenreSelect(genre)}
                  >
                    {genre.name}
                  </div>
                ))}
              </div>
              <div className="mt-2">
                {selectedGenres.map((genre) => (
                  <span
                    key={genre.id}
                    className="inline-block bg-blue-500 text-white p-1 m-1 rounded-md"
                  >
                    {genre.name}{" "}
                    <button onClick={() => handleRemoveGenre(genre)}>x</button>
                  </span>
                ))}
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
                id="actors"
                placeholder="Search Actor Names"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm mb-2"
                onChange={handleActorChange}
              />
              <div className="bg-white shadow-md rounded-md mt-2">
                {filteredActors.map((actor) => (
                  <div
                    key={actor.id}
                    className="p-2 hover:bg-gray-200 cursor-pointer"
                    onClick={() => handleActorSelect(actor)}
                  >
                    {actor.name}
                  </div>
                ))}
              </div>
              <div className="mt-2">
                {selectedActors.map((actor) => (
                  <span
                    key={actor.id}
                    className="inline-block bg-green-500 text-white p-1 m-1 rounded-md"
                  >
                    {actor.name}{" "}
                    <button onClick={() => handleRemoveActor(actor)}>x</button>
                  </span>
                ))}
              </div>
            </div>

            {/* Award Section */}
            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label
                  htmlFor="award"
                  className="block text-sm font-medium text-gray-700"
                >
                  Add Award
                </label>
                <input
                  type="text"
                  id="award"
                  name="award"
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                  placeholder="Start typing award..."
                  onChange={handleAwardChange}
                />
                <div className="bg-white shadow-md rounded-md mt-2">
                  {filteredAwards.map((award) => (
                    <div
                      key={award.id}
                      className="p-2 hover:bg-gray-200 cursor-pointer"
                      onClick={() => handleAwardSelect(award)}
                    >
                      {award.award} ({award.year})
                    </div>
                  ))}
                </div>
                <div className="mt-2">
                  {selectedAwards.map((award) => (
                    <span
                      key={award.id}
                      className="inline-block bg-green-500 text-white p-1 m-1 rounded-md"
                    >
                      {award.award} ({award.year}){" "}
                      <button onClick={() => handleRemoveAward(award)}>
                        x
                      </button>
                    </span>
                  ))}
                </div>
              </div>
            </div>

            <div className="flex justify-end mt-4">
              <button
                type="submit"
                className="px-4 py-2 bg-green-600 text-white rounded-md mr-2"
              >
                Submit
              </button>
              <a
                href="/admin/"
                className="px-4 py-2 bg-red-600 text-white rounded-md"
              >
                Cancel
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default MovieForm;
