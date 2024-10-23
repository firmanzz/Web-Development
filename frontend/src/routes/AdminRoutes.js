import { Routes, Route, Navigate } from "react-router-dom";
import MovieListCMS from "../pages/admin/MovieListCMS";
import MovieForm from "../pages/admin/MovieForm";
import Countries from "../pages/admin/Countries";
import Awards from "../pages/admin/Awards";
import Genres from "../pages/admin/Genres";
import Actors from "../pages/admin/Actors";
import Directors from "../pages/admin/Directors";
import Comments from "../pages/admin/Comments";
import Users from "../pages/admin/Users";

// Fungsi untuk mengecek apakah pengguna sudah login
const isAuthenticated = async () => {
  try {
    const response = await fetch('http://localhost:5000/api/get-user', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${process.env.AUTH_SECRET}`
      }
    });
    await response.json(); 
  } catch (error) {
    console.log(error);
  }
};

export default function AdminRoutes() {
  return (
    <Routes>    
      {/* Rute yang memerlukan autentikasi */}
      <Route path="/" element={isAuthenticated() ? <MovieListCMS /> : <Navigate to="/Login" />} />
      <Route path="/addMovie" element={isAuthenticated() ? <MovieForm /> : <Navigate to="/Login" />} />
      <Route path="/editMovie/:id" element={isAuthenticated() ? <MovieForm /> : <Navigate to="/Login" />} />
      <Route path="/countries" element={isAuthenticated() ? <Countries /> : <Navigate to="/Login" />} />
      <Route path="/awards" element={isAuthenticated() ? <Awards /> : <Navigate to="/Login" />} />
      <Route path="/genres" element={isAuthenticated() ? <Genres /> : <Navigate to="/Login" />} />
      <Route path="/actors" element={isAuthenticated() ? <Actors /> : <Navigate to="/Login" />} />
      <Route path="/directors" element={isAuthenticated() ? <Directors /> : <Navigate to="/Login" />} />
      <Route path="/comments" element={isAuthenticated() ? <Comments /> : <Navigate to="/Login" />} />
      <Route path="/users" element={isAuthenticated() ? <Users /> : <Navigate to="/Login" />} />
    </Routes>
  );
}