import React, { useState, useEffect, useRef } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";

const MovieForm = () => {
  const { id } = useParams(); // Get the ID from the URL if we are in edit mode
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);

  const [isEditMode, setIsEditMode] = useState(false); // State to track if we are in edit mode

  const [filteredGenres, setFilteredGenres] = useState([]);
  const [filteredAwards, setFilteredAwards] = useState([]);
  const [filteredActors, setFilteredActors] = useState([]);
  const [filteredDirectors, setFilteredDirectors] = useState([]); // New for directors
  const [filteredAvails, setFilteredAvails] = useState([]);
  const [genres, setGenres] = useState([]);
  const [awards, setAwards] = useState([]);
  const [countries, setCountries] = useState([]);
  const [actors, setActors] = useState([]);
  const [directors, setDirectors] = useState([]); // New for directors
  const [availabilities, setAvailabilities] = useState([]);

  const [selectedGenres, setSelectedGenres] = useState([]);
  const [selectedAwards, setSelectedAwards] = useState([]);
  const [selectedActors, setSelectedActors] = useState([]);
  const [selectedDirectors, setSelectedDirectors] = useState([]); // New for directors
  const [selectedAvailabilities, setSelectedAvailabilities] = useState([]);
  const [removedGenres, setRemovedGenres] = useState([]);
  const [removedActors, setRemovedActors] = useState([]);
  const [removedDirectors, setRemovedDirectors] = useState([]); // New for directors
  const [removedAwards, setRemovedAwards] = useState([]);
  const [removedAvailabilities, setRemovedAvailabilities] = useState([]);

  const [movieDetails, setMovieDetails] = useState({
    title: "",
    alternativetitle: "",
    synopsis: "",
    urlphoto: "",
    releasedate: "",
    availability: "",
    linktrailer: "",
    rating: "",
    duration: "",
    status: "",
    countryid: "",
  });

  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [
          genreResponse,
          awardResponse,
          countryResponse,
          actorResponse,
          directorResponse, // New fetch for directors
          availabilityResponse,
        ] = await Promise.all([
          fetch("http://localhost:5000/api/genres"),
          fetch("http://localhost:5000/api/awards"),
          fetch("http://localhost:5000/api/countries"),
          fetch("http://localhost:5000/api/actors"),
          fetch("http://localhost:5000/api/directors"), // New endpoint for directors
          fetch("http://localhost:5000/api/avail"),
        ]);

        setGenres(await genreResponse.json());
        setAwards(await awardResponse.json());
        setCountries(await countryResponse.json());
        setActors(await actorResponse.json());
        setDirectors(await directorResponse.json()); // Set directors data
        setAvailabilities(await availabilityResponse.json());

        if (id) {
          const movieResponse = await fetch(
            `http://localhost:5000/api/movies/${id}`
          );
          const movieData = await movieResponse.json();

          setMovieDetails(movieData);
          setSelectedGenres(movieData.Genres || []);
          setSelectedAwards(movieData.Awards || []);
          setSelectedActors(movieData.Actors || []);
          setSelectedDirectors(movieData.Directors || []); // Set existing directors
          setSelectedAvailabilities(movieData.Availabilities || []);
          setIsEditMode(true);
        }
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, [id]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    const data = {
      ...movieDetails,
      selectedGenres: selectedGenres.map((genre) => genre.id),
      selectedActors: selectedActors.map((actor) => actor.id),
      selectedDirectors: selectedDirectors.map((director) => director.id), // New for directors
      selectedAwards: selectedAwards.map((award) => award.id),
      selectedAvailabilities: selectedAvailabilities.map((avail) => avail.id),
      removedGenres,
      removedActors,
      removedDirectors, // New for directors
      removedAwards,
      removedAvailabilities,
    };

    try {
      if (isEditMode) {
        await axios.put(`http://localhost:5000/api/movies/${id}`, data);
      } else {
        await axios.post("http://localhost:5000/api/addMovie", data);
      }
      navigate("/admin/");
    } catch (error) {
      console.error("Error submitting movie:", error);
    }
  };

  // Handle form input changes for movie details
  const handleChange = (e) => {
    setMovieDetails({
      ...movieDetails,
      [e.target.name]: e.target.value,
    });
  };

  // Handle genre change and select
  const handleGenreChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = genres.filter((genre) =>
      genre.name.toLowerCase().includes(query)
    );
    setFilteredGenres(filtered);
  };

  const handleGenreSelect = (genre) => {
    if (!selectedGenres.some((g) => g.id === genre.id)) {
      setSelectedGenres([...selectedGenres, genre]);
    }
    setFilteredGenres([]);
  };

  // Handle actor change and select
  const handleActorChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = actors.filter((actor) =>
      actor.name.toLowerCase().includes(query)
    );
    setFilteredActors(filtered);
  };

  const handleActorSelect = (actor) => {
    if (!selectedActors.some((a) => a.id === actor.id)) {
      setSelectedActors([...selectedActors, actor]);
    }
    setFilteredActors([]);
  };

  // Handle award change and select
  const handleAwardChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = awards.filter((award) =>
      award.award.toLowerCase().includes(query)
    );
    setFilteredAwards(filtered);
  };

  const handleAwardSelect = (award) => {
    if (!selectedAwards.some((a) => a.id === award.id)) {
      setSelectedAwards([...selectedAwards, award]);
    }
    setFilteredAwards([]);
  };

  const handleAvailChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = availabilities.filter((avail) =>
      avail.name.toLowerCase().includes(query)
    );
    setFilteredAvails(filtered);
  };

  const handleAvailSelect = (avail) => {
    if (!selectedAvailabilities.some((b) => b.id === avail.id)) {
      setSelectedAvailabilities([...selectedAvailabilities, avail]);
    }
    setFilteredAvails([]);
  };

  const handleGenreRemove = (genre) => {
    setSelectedGenres(selectedGenres.filter((g) => g.id !== genre.id));
    setRemovedGenres([...removedGenres, genre.id]); // Tambahkan ke daftar yang akan dihapus
  };

  const handleActorRemove = (actor) => {
    setSelectedActors(selectedActors.filter((a) => a.id !== actor.id));
    setRemovedActors([...removedActors, actor.id]);
  };

  const handleAwardRemove = (award) => {
    setSelectedAwards(selectedAwards.filter((a) => a.id !== award.id));
    setRemovedAwards([...removedAwards, award.id]);
  };

  const handleAvailRemove = (avail) => {
    setSelectedAvailabilities(
      selectedAvailabilities.filter((a) => a.id !== avail.id)
    );
    setRemovedAvailabilities([...removedAvailabilities, avail.id]);
  };

  const handleDirectorChange = (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = directors.filter((director) =>
      director.name.toLowerCase().includes(query)
    );
    setFilteredDirectors(filtered);
  };

  const handleDirectorSelect = (director) => {
    if (!selectedDirectors.some((d) => d.id === director.id)) {
      setSelectedDirectors([...selectedDirectors, director]);
    }
    setFilteredDirectors([]);
  };

  const handleDirectorRemove = (director) => {
    setSelectedDirectors(selectedDirectors.filter((d) => d.id !== director.id));
    setRemovedDirectors([...removedDirectors, director.id]); // Track removed directors
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="container mb-10 mx-5 mt-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-4">
            {isEditMode ? "Edit Movie" : "Add Movie"}
          </h1>
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
                  value={movieDetails.title}
                  onChange={handleChange}
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
                  name="alternativetitle"
                  value={movieDetails.alternativetitle}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label
                  htmlFor="releasedate"
                  className="block text-sm font-medium text-gray-700"
                >
                  Release Date
                </label>
                <input
                  type="date"
                  id="releasedate"
                  name="releasedate"
                  value={movieDetails.releasedate}
                  onChange={handleChange}
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
                  value={movieDetails.countryid}
                  onChange={handleChange}
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
                  type="number"
                  id="duration"
                  name="duration"
                  min="1"
                  max="1000"
                  value={movieDetails.duration}
                  onChange={handleChange}
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
                <select
                  id="status"
                  name="status"
                  value={movieDetails.status}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                >
                  <option value="On-going">On-going</option>
                  <option value="Released">Released</option>
                </select>
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
                  value={movieDetails.urlphoto}
                  onChange={handleChange}
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
                  value={movieDetails.linktrailer}
                  onChange={handleChange}
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
                value={movieDetails.synopsis}
                onChange={handleChange}
                rows="3"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
              ></textarea>
            </div>

            <div className="mb-4">
              <label
                htmlFor="availabilities"
                className="block text-sm font-medium text-gray-700"
              >
                Add Availabilities
              </label>
              <input
                type="text"
                id="availabilities"
                name="availabilities"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                placeholder="Start typing availabilities..."
                onChange={handleAvailChange}
              />
              <div className="bg-white shadow-md rounded-md mt-2">
                {filteredAvails.map((avail) => (
                  <div
                    key={avail.id}
                    className="p-2 hover:bg-gray-200 cursor-pointer"
                    onClick={() => handleAvailSelect(avail)}
                  >
                    {avail.name}
                  </div>
                ))}
              </div>
              <div className="mt-2">
                {selectedAvailabilities.map((avail) => (
                  <span
                    key={avail.id}
                    className="inline-block bg-blue-500 text-white p-1 m-1 rounded-md"
                  >
                    {avail.name}{" "}
                    <button onClick={() => handleAvailRemove(avail)}>x</button>
                  </span>
                ))}
              </div>
            </div>

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
                    <button onClick={() => handleGenreRemove(genre)}>x</button>
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
                    <button onClick={() => handleActorRemove(actor)}>x</button>
                  </span>
                ))}
              </div>
            </div>

            <div className="mb-4">
              <label
                htmlFor="directors"
                className="block text-sm font-medium text-gray-700"
              >
                Add Directors
              </label>
              <input
                type="text"
                id="directors"
                placeholder="Search Director Names"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm mb-2"
                onChange={handleDirectorChange}
              />
              <div className="bg-white shadow-md rounded-md mt-2">
                {filteredDirectors.map((director) => (
                  <div
                    key={director.id}
                    className="p-2 hover:bg-gray-200 cursor-pointer"
                    onClick={() => handleDirectorSelect(director)}
                  >
                    {director.name}
                  </div>
                ))}
              </div>
              <div className="mt-2">
                {selectedDirectors.map((director) => (
                  <span
                    key={director.id}
                    className="inline-block bg-green-500 text-white p-1 m-1 rounded-md"
                  >
                    {director.name}{" "}
                    <button onClick={() => handleDirectorRemove(director)}>x</button>
                  </span>
                ))}
              </div>
            </div>

            <div className="mb-4">
              <label
                htmlFor="awards"
                className="block text-sm font-medium text-gray-700"
              >
                Add Awards
              </label>
              <input
                type="text"
                id="awards"
                placeholder="Search Award Names"
                className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm mb-2"
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
                    <button onClick={() => handleAwardRemove(award)}>x</button>
                  </span>
                ))}
              </div>
            </div>

            <div className="flex justify-end mt-4">
              <button
                type="submit"
                className="px-4 py-2 bg-green-600 text-white rounded-md mr-2"
              >
                {isEditMode ? "Update Movie" : "Submit"}
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
