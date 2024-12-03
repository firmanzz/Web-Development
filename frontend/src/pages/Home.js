import { useState, useEffect, useRef } from "react";
import Sidebar from "../components/Sidebar";
import Header from "../components/Header";
import MovieList from "../components/MovieList";
import MovieDetail from './MovieDetail';
import Footer from "../components/Footer";

const Home = () => {
  const [open, setOpen] = useState(false);
  const [genre, setGenre] = useState("");
  const [year, setYear] = useState("");
  const [status, setStatus] = useState("");
  const [showMovieDetail, setShowMovieDetail] = useState(false);
  const sidebarRef = useRef(null);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (sidebarRef.current && !sidebarRef.current.contains(event.target)) {
        setOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [sidebarRef]);

  const handleSubmit = () => {
    console.log("Genre:", genre);
    console.log("Year:", year);
    console.log("Status:", status);
  };

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
              backgroundImage: 'url(http://master-movie-cms.vercel.app/uploads/home_background.jpg)',
            }}
          >
            <div className="absolute inset-0 backdrop-blur-lg"></div>
          </div>
          <div className="relative z-20 flex flex-col flex-grow items-center justify-start pt-2">
            {!showMovieDetail ? (
              <MovieList 
                genre={genre}
                setGenre={setGenre}
                year={year}
                setYear={setYear}
                status={status}
                setStatus={setStatus}
                handleSubmit={handleSubmit}
                onMovieClick={toggleMovieDetail}
              />
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
