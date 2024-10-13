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
import Login from "../pages/Login";
import Register from "../pages/Register";

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
    const data = await response.json();
    console.log("DATA USER", data);    
  } catch (error) {
    console.log(error);
  }
};

export default function AdminRoutes() {
  return (
    <Routes>
      <Route path="/login" element={<Login />} />
      <Route path="/register" element={<Register />} />
      
      {/* Rute yang memerlukan autentikasi */}
      <Route path="/" element={isAuthenticated() ? <MovieListCMS /> : <Navigate to="/admin/login/" />} />
      <Route path="/addMovie" element={isAuthenticated() ? <MovieForm /> : <Navigate to="/admin/login/" />} />
      <Route path="/editMovie/:id" element={isAuthenticated() ? <MovieForm /> : <Navigate to="/admin/login/" />} />
      <Route path="/countries" element={isAuthenticated() ? <Countries /> : <Navigate to="/admin/login/" />} />
      <Route path="/awards" element={isAuthenticated() ? <Awards /> : <Navigate to="/admin/login/" />} />
      <Route path="/genres" element={isAuthenticated() ? <Genres /> : <Navigate to="/admin/login/" />} />
      <Route path="/actors" element={isAuthenticated() ? <Actors /> : <Navigate to="/admin/login/" />} />
      <Route path="/directors" element={isAuthenticated() ? <Directors /> : <Navigate to="/admin/login/" />} />
      <Route path="/comments" element={isAuthenticated() ? <Comments /> : <Navigate to="/admin/login/" />} />
      <Route path="/users" element={isAuthenticated() ? <Users /> : <Navigate to="/admin/login/" />} />
    </Routes>
  );
}