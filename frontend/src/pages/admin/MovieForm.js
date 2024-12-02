import React, { useState, useEffect, useRef } from "react";
import { useParams, useNavigate } from "react-router-dom";
import Sidebar from "./SidebarCMS";
import Header from "./HeaderCMS";
import Cookies from "js-cookie";

const MovieForm = () => {
  const { id } = useParams(); // Get the ID from the URL if we are in edit mode
  const [open, setOpen] = useState(false);
  const sidebarRef = useRef(null);

  const [isEditMode, setIsEditMode] = useState(false);
  const [errors, setErrors] = useState({});

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
        const token = Cookies.get("token"); // Ambil token dari cookies
        const [
          genreResponse,
          awardResponse,
          countryResponse,
          actorResponse,
          directorResponse, // New fetch for directors
          availabilityResponse,
        ] = await Promise.all([
          fetch("https://master-movie-cms.vercel.app/api/genres", {
            headers: {
              Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
            },
          }),
          fetch("https://master-movie-cms.vercel.app/api/awards", {
            headers: {
              Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
            },
          }),
          fetch("https://master-movie-cms.vercel.app/api/countries", {
            headers: {
              Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
            },
          }),
          fetch("https://master-movie-cms.vercel.app/api/actors", {
            headers: {
              Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
            },
          }),
          fetch("https://master-movie-cms.vercel.app/api/directors", {
            headers: {
              Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
            },
          }), // New endpoint for directors
          fetch("https://master-movie-cms.vercel.app/api/avail", {
            headers: {
              Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
            },
          }),
        ]);

        setGenres(await genreResponse.json());
        setAwards(await awardResponse.json());
        setCountries(await countryResponse.json());
        setActors(await actorResponse.json());
        setDirectors(await directorResponse.json()); // Set directors data
        setAvailabilities(await availabilityResponse.json());

        if (id) {
          const movieResponse = await fetch(
            `https://master-movie-cms.vercel.app/api/movies/${id}`,
            {
              headers: {
                Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
              },
            }
          );
          const movieData = await movieResponse.json();

          const formattedReleaseDate = new Date(movieData.releasedate)
            .toISOString()
            .split("T")[0];

          setMovieDetails({
            ...movieData,
            releasedate: formattedReleaseDate,
          });
          setSelectedGenres(movieData.Genres || []);
          setSelectedAwards(movieData.Awards || []);
          setSelectedActors(movieData.Actors || []);
          setSelectedDirectors(movieData.Directors || []);
          setSelectedAvailabilities(movieData.Availabilities || []);
          setIsEditMode(true);
        }
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, [id]);

  const validateForm = () => {
    const errors = {};

    // Title validation
    if (!movieDetails.title.trim()) {
      errors.title = "Title is required";
    }

    // Synopsis validation
    if (!movieDetails.synopsis.trim()) {
      errors.synopsis = "Synopsis is required";
    } else if (movieDetails.synopsis.length > 5000) {
      errors.synopsis = "Synopsis should not exceed 1000 characters";
    }

    // Release Date validation
    if (!movieDetails.releasedate) {
      errors.releasedate = "Release date is required";
    } else if (new Date(movieDetails.releasedate) > new Date()) {
      errors.releasedate = "Release date cannot be in the future";
    }

    // Country validation
    if (!movieDetails.countryid) {
      errors.countryid = "Country selection is required";
    }

    if (!movieDetails.rating) {
      errors.rating = "Rating is required";
    } else if (
      parseFloat(movieDetails.rating) < 1 ||
      parseFloat(movieDetails.rating) > 10
    ) {
      errors.rating = "Rating must be between 1 and 10";
    }

    // Duration validation
    if (!movieDetails.duration || movieDetails.duration <= 0) {
      errors.duration = "Duration must be a positive number";
    } else if (movieDetails.duration < 1 || movieDetails.duration > 1000) {
      errors.duration = "Duration must be between 1 and 1000 minutes";
    }

    // URL Poster validation
    if (!movieDetails.urlphoto.trim()) {
      errors.urlphoto = "Poster URL is required";
    } else if (!/^https?:\/\/.+\..+$/.test(movieDetails.urlphoto)) {
      errors.urlphoto = "Poster URL must be valid";
    }

    // Link Trailer validation
    if (!movieDetails.linktrailer.trim()) {
      errors.linktrailer = "Trailer link is required";
    } else if (!/^https:\/\/.+\..+$/.test(movieDetails.linktrailer)) {
      errors.linktrailer = "Trailer link must be a valid embeddable URL";
    }

    if (selectedGenres.length < 1) {
      errors.genres = "At least one genre must be selected";
    }
    if (selectedActors.length < 1) {
      errors.actors = "At least one actor must be selected";
    }
    if (selectedDirectors.length < 1) {
      errors.directors = "At least one director must be selected";
    }

    if (selectedAvailabilities.length < 1) {
      errors.availabilities = "At least one availability must be selected";
    }

    setErrors(errors);
    return Object.keys(errors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!validateForm()) {
      return;
    }

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
      const token = Cookies.get("token"); // Get token from cookies

      const options = {
        method: isEditMode ? "PUT" : "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`, // Add the bearer token
        },
        body: JSON.stringify(data), // Convert data to JSON string
      };

      const url = isEditMode
        ? `https://master-movie-cms.vercel.app/api/movies/${id}`
        : "https://master-movie-cms.vercel.app/api/addMovie";

      const response = await fetch(url, options);

      if (!response.ok) {
        throw new Error(`Error: ${response.statusText}`);
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
                {errors.title && (
                  <p className="text-red-500 text-sm">{errors.title}</p>
                )}
              </div>
              <div>
                <label
                  htmlFor="alternativeTitle"
                  className="block text-sm font-medium text-gray-700"
                >
                  Alternative Title {"("}Optional{")"}
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

            {/* Additional Fields for Validation */}
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
                {errors.releasedate && (
                  <p className="text-red-500 text-sm">{errors.releasedate}</p>
                )}
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
                {errors.countryid && (
                  <p className="text-red-500 text-sm">{errors.countryid}</p>
                )}
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label
                  htmlFor="duration"
                  className="block text-sm font-medium text-gray-700"
                >
                  Duration {"("}1-1000 min{")"}
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
                {errors.urlphoto && (
                  <p className="text-red-500 text-sm">{errors.urlphoto}</p>
                )}
                {/* Poster Preview */}
                {movieDetails.urlphoto && (
                  <div className="mt-2 flex justify-center">
                    <img
                      src={movieDetails.urlphoto}
                      alt="Poster Preview"
                      className="w-36 h-auto rounded-md shadow-lg"
                    />
                  </div>
                )}
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
                {errors.linktrailer && (
                  <p className="text-red-500 text-sm">{errors.linktrailer}</p>
                )}
                {/* Trailer Preview */}
                {movieDetails.linktrailer && (
                  <div className="mt-2 flex justify-center">
                    <iframe
                      src={movieDetails.linktrailer.replace(
                        "watch?v=",
                        "embed/"
                      )}
                      title="Trailer Preview"
                      className="w-96 h-56 rounded-md shadow-lg"
                      allowFullScreen
                    />
                  </div>
                )}
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4 mb-4">
              <div>
                <label
                  htmlFor="rating"
                  className="block text-sm font-medium text-gray-700"
                >
                  Rating (1-10)
                </label>
                <input
                  type="number"
                  id="rating"
                  name="rating"
                  value={movieDetails.rating}
                  onChange={handleChange}
                  min="1"
                  max="10"
                  step="0.1"
                  className="mt-1 block w-full rounded-md bg-gray-200 shadow-sm"
                />
                {errors.rating && (
                  <p className="text-red-500 text-sm">{errors.rating}</p>
                )}
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
              {errors.availabilities && (
                <p className="text-red-500 text-sm">{errors.availabilities}</p>
              )}
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
              {errors.genres && (
                <p className="text-red-500 text-sm">{errors.genres}</p>
              )}
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
              {errors.actors && (
                <p className="text-red-500 text-sm">{errors.actors}</p>
              )}
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
                    <button onClick={() => handleDirectorRemove(director)}>
                      x
                    </button>
                  </span>
                ))}
              </div>
              {errors.directors && (
                <p className="text-red-500 text-sm">{errors.directors}</p>
              )}
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
