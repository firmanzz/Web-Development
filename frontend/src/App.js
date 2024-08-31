import { useState, useEffect, useRef } from "react";
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Sidebar from "./components/Sidebar";
import Header from "./components/Header";
import MovieList from "./components/MovieList";
import Login from "./components/Login";
import Register from "./components/Register";
import MovieDetail from './components/MovieDetail';
import Footer from "./components/Footer";

const AppContent = ({ open, setOpen }) => {
  const sidebarRef = useRef(null);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (sidebarRef.current && !sidebarRef.current.contains(event.target)) {
        setOpen(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [setOpen]);

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-col flex-grow overflow-y-auto bg-gray-800">
          <div className="flex flex-col flex-grow items-center justify-start pt-2">
            <Routes>
              <Route path="/" element={<MovieList />} />
              <Route path="/details/:id" element={<MovieDetail />} />
              <Route path="/login" element={<Login />} />
              <Route path="/register" element={<Register />} />
            </Routes>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

const App = () => {
  const [open, setOpen] = useState(false);
  const [genre, setGenre] = useState("");
  const [year, setYear] = useState("");
  const [status, setStatus] = useState("");

  const handleSubmit = () => {
    console.log("Genre:", genre);
    console.log("Year:", year);
    console.log("Status:", status);
  };

  return (
    <Router>
      <AppContent 
        open={open} 
        setOpen={setOpen} 
        genre={genre} 
        setGenre={setGenre} 
        year={year} 
        setYear={setYear} 
        status={status} 
        setStatus={setStatus} 
        handleSubmit={handleSubmit} 
      />
    </Router>
  );
};

export default App;
