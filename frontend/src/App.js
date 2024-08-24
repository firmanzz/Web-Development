import { useState } from "react";
import Sidebar from "./components/Sidebar";
import Header from "./components/Header";
import SearchBar from "./components/SearchBar";
import Filter from "./components/Filter";
import MovieList from "./components/MovieList";
import Login from "./components/Login"; // Import komponen Login
import Register from "./components/Register"; // Import komponen Register

const App = () => {
  const [open, setOpen] = useState(true);
  const [submenuOpen, setSubmenuOpen] = useState(false);
  const [genre, setGenre] = useState("");
  const [year, setYear] = useState("");
  const [status, setStatus] = useState("");

  const handleSubmit = () => {
    console.log("Genre:", genre);
    console.log("Year:", year);
    console.log("Status:", status);
  };

  // Cek URL untuk menentukan halaman yang ditampilkan
  const currentPath = window.location.pathname;

  if (currentPath === "/login") {
    return (
      <div className="flex flex-col bg-background min-h-screen">
        <Header />
        <div className="flex items-center justify-center flex-grow">
          <Login />
        </div>
      </div>
    );
  }

  if (currentPath === "/register") {
    return (
      <div className="flex flex-col bg-background min-h-screen">
        <Header />
        <div className="flex items-center justify-center flex-grow">
          <Register />
        </div>
      </div>
    );
  }

  return (
    <div className="flex bg-background">
      <Sidebar open={open} setOpen={setOpen} submenuOpen={submenuOpen} setSubmenuOpen={setSubmenuOpen} />
      <div className="flex flex-col flex-grow h-screen">
        <Header />
        <div className="flex flex-col items-center justify-start pt-2">
          <SearchBar />
          <Filter genre={genre} setGenre={setGenre} year={year} setYear={setYear} status={status} setStatus={setStatus} handleSubmit={handleSubmit} />
          <MovieList />
        </div>
      </div>
    </div>
  );
};

export default App;
