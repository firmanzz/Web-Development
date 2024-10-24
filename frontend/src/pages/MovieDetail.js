import React, { useState, useEffect, useRef } from "react";
import { useParams } from "react-router-dom";
import Sidebar from "../components/Sidebar";
import Header from "../components/Header";
import Footer from "../components/Footer";

const MovieDetail = () => {
  const [open, setOpen] = useState(false);
  const { id } = useParams(); // Get movie ID from URL
  const [movie, setMovie] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [newReview, setNewReview] = useState({
    rating: 0,
    comment: "",
  });
  const [submitting, setSubmitting] = useState(false);
  const sidebarRef = useRef(null);

  useEffect(() => {
    const fetchMovie = async () => {
      try {
        const response = await fetch(
          `http://localhost:5000/api/movies/${id}/detail`
        );
        if (!response.ok) {
          throw new Error(`Error fetching movie: ${response.statusText}`);
        }
        const data = await response.json();
        setMovie(data);
        setLoading(false);
      } catch (error) {
        setError("Failed to load movie data. Please try again later.");
        setLoading(false);
      }
    };

    fetchMovie();
  }, [id]);

  const handleReviewSubmit = async (e) => {
    e.preventDefault();
    setSubmitting(true);
    try {
      const response = await fetch(
        `http://localhost:5000/api/movies/${id}/reviews`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(newReview),
        }
      );

      if (!response.ok) {
        throw new Error("Failed to submit review.");
      }

      const updatedMovie = await response.json();
      setMovie(updatedMovie);
      setNewReview({ rating: 0, comment: "" });
    } catch (error) {
      setError("Failed to submit review. Please try again.");
    } finally {
      setSubmitting(false);
    }
  };
  if (loading) {
    return <p className="text-white text-center">Loading movie details...</p>;
  }

  if (error) {
    return <p className="text-red-500 text-center">{error}</p>;
  }

  if (!movie) {
    return <p className="text-white text-center">No movie data available</p>;
  }

  const embedLink = movie.linktrailer.replace("watch?v=", "embed/");

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-grow bg-gray-800">
          <div
            className="relative bg-cover bg-center bg-no-repeat"
            style={{
              backgroundImage: `url(${movie.urlphoto})`,
            }}
          >
            <div
              className="fixed top-0 left-0 w-full h-full bg-cover bg-center bg-no-repeat z-0"
              style={{ backgroundImage: `url(${movie.urlphoto})` }}
            >
              <div className="absolute inset-0 backdrop-blur-lg"></div>
            </div>

            <div className="relative z-20 container mx-auto p-4 sm:p-6">
              <div className="p-6 mb-6 flex flex-col lg:flex-row">
                <div className="flex-none w-full lg:w-auto mb-4 lg:mb-0">
                  <img
                    src={movie.urlphoto}
                    alt={movie.title}
                    className="w-auto h-auto max-w-full max-h-full rounded-lg shadow-lg"
                    style={{ maxHeight: "450px", objectFit: "cover" }}
                  />
                </div>

                <div className="flex-grow lg:ml-6">
                  <iframe
                    width="100%"
                    height="450"
                    src={embedLink}
                    title={`${movie.title} Trailer`}
                    frameBorder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerPolicy="strict-origin-when-cross-origin"
                    allowFullScreen
                    className="rounded-lg shadow-lg"
                  ></iframe>
                </div>
              </div>

              <div className="p-6 rounded-lg shadow-lg mb-6 bg-white">
                <h2 className="text-3xl font-bold mb-3 text-gray-800">
                  {movie.title}
                </h2>
                <p className="mb-2 text-sm text-gray-800">
                  <strong>Date:</strong>{" "}
                  {new Date(movie.releasedate).toLocaleDateString()}
                </p>
                <p className="mb-2 text-sm text-gray-800">
                  <strong>Duration:</strong> {movie.duration} min
                </p>
                <p className="mb-4 text-sm text-gray-800">{movie.synopsis}</p>
                <p className="mb-2 text-sm text-gray-800">
                  <strong>Genre:</strong>{" "}
                  {movie.Genres
                    ? movie.Genres.map((genre) => genre.name).join(", ")
                    : "No Genres"}
                </p>
                <p className="mb-2 text-sm text-gray-800">
                  <strong>Rating:</strong> {movie.rating}/10
                </p>

                {/* Display availabilities */}
                <p className="mb-2 text-sm text-gray-800">
                  <strong>Available on:</strong>{" "}
                  {movie.Availabilities
                    ? movie.Availabilities.map((avail) => avail.name).join(", ")
                    : "No Availability"}
                </p>

                {/* Display awards */}
                <p className="mb-2 text-sm text-gray-800">
                  <strong>Awards:</strong>{" "}
                  {movie.Awards
                    ? movie.Awards.map(
                        (award) => `${award.award} (${award.year})`
                      ).join(", ")
                    : "No Awards"}
                </p>
              </div>

              {/* Cast & Directors section */}
              <div className="p-6 rounded-lg shadow-lg mb-6 bg-white">
                <div className="flex justify-between">
                  {/* Cast section */}
                  <div className="flex flex-col w-3/4">
                    <h3 className="text-lg font-bold mb-3 text-gray-800">
                      Cast
                    </h3>
                    <div className="flex space-x-4 overflow-x-auto no-scrollbar">
                      {movie.Actors && movie.Actors.length > 0 ? (
                        movie.Actors.map((actor) => (
                          <div key={actor.id} className="text-center">
                            <img
                              src={actor.urlphoto}
                              alt={actor.name}
                              className="w-20 h-20 rounded-full shadow-lg"
                            />
                            <p className="text-sm text-gray-800 mt-2">
                              {actor.name}
                            </p>
                          </div>
                        ))
                      ) : (
                        <p className="text-sm text-gray-600">No Actors</p>
                      )}
                    </div>
                  </div>

                  {/* Director section */}
                  <div className="flex flex-col w-1/4">
                    <h3 className="text-lg font-bold mb-3 text-gray-800">
                      Directors
                    </h3>
                    <div className="flex flex-col items-center">
                      {movie.Directors && movie.Directors.length > 0 ? (
                        movie.Directors.map((director) => (
                          <div key={director.id} className="text-center">
                            <img
                              src={director.urlphoto}
                              alt={director.name}
                              className="w-20 h-20 rounded-full shadow-lg"
                            />
                            <p className="text-sm text-gray-800 mt-2">
                              {director.name}
                            </p>
                          </div>
                        ))
                      ) : (
                        <p className="text-sm text-gray-600">No Directors</p>
                      )}
                    </div>
                  </div>
                </div>
              </div>

              <div className="p-6 rounded-lg shadow-lg mb-6 bg-white">
                <h3 className="text-lg font-bold mb-3 text-gray-800">
                  User Reviews
                </h3>
                {movie.Users && movie.Users.length > 0 ? (
                  movie.Users.map((user) => (
                    <div key={user.id} className="mb-4">
                      <div className="flex justify-between items-center">
                        <p className="text-2xl font-bold text-gray-800 ">
                          {user.name}
                          <span className="text-yellow-500 text-3xl ml-2">
                            {Array.from({ length: 5 }, (v, i) => (
                              <span key={i}>
                                {i < Math.floor(user.Comment.rate) ? "★" : "☆"}
                              </span>
                            ))}
                          </span>
                        </p>
                        <p className="text-xs text-gray-600">
                          {new Date(user.Comment.time).toLocaleDateString()}
                        </p>
                      </div>
                      <p className="text-xl text-gray-800">
                        {user.Comment.comment}
                      </p>
                    </div>
                  ))
                ) : (
                  <p className="text-sm text-gray-600">No Comments</p>
                )}
              </div>
              <div className="p-6 rounded-lg shadow-lg mb-6 bg-white">
              <h3 className="text-lg font-bold mb-3 text-gray-800">
                Submit Your Review
              </h3>
              <form onSubmit={handleReviewSubmit} className="mb-6">
                <div className="mb-4">
                  <label
                    htmlFor="rating"
                    className="block text-gray-700 text-sm font-bold mb-2"
                  >
                    Rating (1-5):
                  </label>
                  <input
                    type="number"
                    id="rating"
                    name="rating"
                    min="1"
                    max="5"
                    value={newReview.rating}
                    onChange={(e) =>
                      setNewReview({ ...newReview, rating: e.target.value })
                    }
                    required
                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700"
                  />
                </div>

                <div className="mb-4">
                  <label
                    htmlFor="comment"
                    className="block text-gray-700 text-sm font-bold mb-2"
                  >
                    Comment:
                  </label>
                  <textarea
                    id="comment"
                    name="comment"
                    value={newReview.comment}
                    onChange={(e) =>
                      setNewReview({ ...newReview, comment: e.target.value })
                    }
                    required
                    className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700"
                    rows="4"
                  ></textarea>
                </div>

                <div>
                  <button
                    type="submit"
                    disabled={submitting}
                    className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                  >
                    {submitting ? "Submitting..." : "Submit Review"}
                  </button>
                </div>
              </form>
            </div>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default MovieDetail;
