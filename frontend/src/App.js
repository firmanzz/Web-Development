import { useState } from "react";
import { BrowserRouter as Router, Route, Routes, useLocation } from 'react-router-dom';
import Sidebar from "./components/Sidebar";
import Header from "./components/Header";
import SearchBar from "./components/SearchBar";
import Filter from "./components/Filter";
import MovieList from "./components/MovieList";
import Login from "./components/Login";
import Register from "./components/Register";
import MovieDetail from './components/MovieDetail';

const AppContent = ({ open, setOpen, genre, setGenre, year, setYear, status, setStatus, handleSubmit }) => {
  const location = useLocation();

  return (
    <div className="flex bg-gray-800">
      <Sidebar open={open} />
      <div className="flex flex-col flex-grow h-screen">
        <Header open={open} setOpen={setOpen}/>
        <div className="flex flex-col items-center justify-start pt-2">
          {location.pathname !== '/login' && location.pathname !== '/register' && (
            <>
              <SearchBar />
              <Filter genre={genre} setGenre={setGenre} year={year} setYear={setYear} status={status} setStatus={setStatus} handleSubmit={handleSubmit} />
            </>
          )}
          <Routes>
            <Route path="/" element={<MovieList />} />
            <Route path="/details/:id" element={<MovieDetail />} />
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
          </Routes>
        </div>
      </div>
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
