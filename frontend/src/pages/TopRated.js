import { useState, useEffect, useRef } from "react";
import { Link } from "react-router-dom";
import Sidebar from "../components/Sidebar";
import Header from "../components/Header";
import MovieDetail from './MovieDetail';
import Footer from "../components/Footer";

const Home = () => {
  const [open, setOpen] = useState(false);
  const [movies, setMovies] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [showMovieDetail, setShowMovieDetail] = useState(false);
  const sidebarRef = useRef(null);

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const token = document.cookie.split('; ').find(row => row.startsWith('token=')).split('=')[1];
        const response = await fetch("https://master-movie-cms.vercel.app/api/movies/top", {
          headers: {
            'Authorization': `Bearer ${token}`
          }
        });
        if (!response.ok) {
          throw new Error(`Failed to fetch movies: ${response.statusText}`);
        }
        const data = await response.json();
        setMovies(data);
        setLoading(false);
      } catch (error) {
        console.error("Error fetching movies:", error);
        setError("Failed to load movies. Please try again later.");
        setLoading(false);
      }
    };

    fetchMovies();
  }, []);

  const toggleMovieDetail = () => {
    setShowMovieDetail((prev) => !prev);
  };

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-col flex-grow overflow-y-auto bg-gray-800 relative">
          <div
            className="fixed top-0 left-0 w-full h-full bg-cover bg-center bg-no-repeat z-0"
            style={{
              backgroundImage: 'url(https://master-movie-cms.vercel.app/uploads/home_background.jpg)',
            }}
          >
            <div className="absolute inset-0 backdrop-blur-lg"></div>
          </div>
          <div className="relative z-20 flex flex-col flex-grow items-center justify-start pt-2">
            {!showMovieDetail ? (
              <div className="container mx-auto">
              <div className="flex justify-center my-4">
              </div>
              {loading ? (
                <p className="text-white text-center">Loading movies...</p>
              ) : error ? (
                <p className="text-red-500 text-center">{error}</p>
              ) : (
                <>
                  <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-16 mt-10 mb-10">
                    {movies.map((movie) => (
                      <Link to={`/details/${movie.id}`} key={movie.id}>
                        <div className="text-center">
                          <img src={movie.urlphoto} alt={movie.urlphoto} className="h-full w-full object-cover rounded-md mb-2" />
                          <h3 className="text-white text-sm font-bold mb-1">{movie.title}</h3>
                          <p className="text-white text-sm font-semibold">{movie.Genres.map((genre) => genre.name).join(", ")}</p>
                          <p className="text-yellow-500 text-xs font-semibold">Rating: {movie.rating}</p>
                        </div>
                      </Link>
                    ))}
                  </div>
                </>
              )}
            </div>
            ) : (
              <MovieDetail 
                onBackClick={toggleMovieDetail} 
              />
            )}
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default Home;
