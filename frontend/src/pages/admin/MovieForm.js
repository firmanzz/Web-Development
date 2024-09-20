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

  // State to hold data from API for dropdowns
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
        const [genreResponse, awardResponse, countryResponse, actorResponse] = await Promise.all([
          fetch("http://localhost:5000/api/genres"),
          fetch("http://localhost:5000/api/awards"),
          fetch("http://localhost:5000/api/countries"),
          fetch("http://localhost:5000/api/actors"),
        ]);

        setGenres(await genreResponse.json());
        setAwards(await awardResponse.json());
        setCountries(await countryResponse.json());
        setActors(await actorResponse.json());

        // If we are in edit mode, fetch the movie details
        if (id) {
          const movieResponse = await fetch(`http://localhost:5000/api/movies/${id}`);
          const movieData = await movieResponse.json();

          // Set the form fields with the movie data for editing
          setMovieDetails(movieData);
          setSelectedGenres(movieData.Genres || []);
          setSelectedAwards(movieData.Awards || []);
          setSelectedActors(movieData.Actors || []);
          setIsEditMode(true); // Set edit mode to true
        }
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, [id]);

  // Handle form submit for both add and edit
  const handleSubmit = async (e) => {
    e.preventDefault();

    // Data to be sent to the backend
    const data = {
      ...movieDetails, // include movie details
      selectedGenres, // selected genres
      selectedActors, // selected actors
      selectedAwards, // selected awards
    };

    try {
      if (isEditMode) {
        // Send a PUT request if we are editing
        await axios.put(`http://localhost:5000/api/movies/${id}`, data);
        console.log("Movie updated successfully.");
      } else {
        // Send a POST request if we are adding a new movie
        await axios.post("http://localhost:5000/api/addMovie", data);
        console.log("Movie created successfully.");
      }

      // Redirect to the movies list or display success message
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

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="container mb-10 mx-5 mt-4">
          <h1 className="text-3xl md:text-4xl font-bold mb-4">
            {isEditMode ? "Edit Movie" : "Add Movie"}
          </h1>
          <form method="POST" encType="multipart/form-data" onSubmit={handleSubmit}>
            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label htmlFor="title" className="block text-sm font-medium text-gray-700">
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
                <label htmlFor="country" className="block text-sm font-medium text-gray-700">
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
                <label htmlFor="duration" className="block text-sm font-medium text-gray-700">
                  Duration
                </label>
                <input
                  type="text"
                  id="duration"
                  name="duration"
                  value={movieDetails.duration}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
              <div>
                <label htmlFor="status" className="block text-sm font-medium text-gray-700">
                  Status
                </label>
                <input
                  type="text"
                  id="status"
                  name="status"
                  value={movieDetails.status}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label htmlFor="rating" className="block text-sm font-medium text-gray-700">
                  Rating
                </label>
                <input
                  type="text"
                  id="rating"
                  name="rating"
                  value={movieDetails.rating}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
              <div>
                <label htmlFor="availability" className="block text-sm font-medium text-gray-700">
                  Availability
                </label>
                <input
                  type="text"
                  id="availability"
                  name="availability"
                  value={movieDetails.availability}
                  onChange={handleChange}
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label htmlFor="urlphoto" className="block text-sm font-medium text-gray-700">
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
                <label htmlFor="linktrailer" className="block text-sm font-medium text-gray-700">
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
              <label htmlFor="synopsis" className="block text-sm font-medium text-gray-700">
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
              <label htmlFor="genres" className="block text-sm font-medium text-gray-700">
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
                    <button onClick={() => setSelectedGenres(selectedGenres.filter(g => g.id !== genre.id))}>
                      x
                    </button>
                  </span>
                ))}
              </div>
            </div>

            <div className="mb-4">
              <label htmlFor="actors" className="block text-sm font-medium text-gray-700">
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
                    <button onClick={() => setSelectedActors(selectedActors.filter(a => a.id !== actor.id))}>
                      x
                    </button>
                  </span>
                ))}
              </div>
            </div>

            <div className="mb-4">
              <label htmlFor="awards" className="block text-sm font-medium text-gray-700">
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
                    <button onClick={() => setSelectedAwards(selectedAwards.filter(a => a.id !== award.id))}>
                      x
                    </button>
                  </span>
                ))}
              </div>
            </div>

            <div className="flex justify-end mt-4">
              <button type="submit" className="px-4 py-2 bg-green-600 text-white rounded-md mr-2">
                {isEditMode ? "Update Movie" : "Submit"}
              </button>
              <a href="/admin/" className="px-4 py-2 bg-red-600 text-white rounded-md">
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