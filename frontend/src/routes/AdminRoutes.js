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

const AdminRoutes = () => {
  const token = localStorage.getItem('token'); 
  const role = localStorage.getItem('role');

  if (!token || role !== 'admin') {
    return <Navigate to="/Login" />;
  }

  return (
    <Routes>
      <Route path="/" element={<MovieListCMS />} />
      <Route path="/addMovie" element={<MovieForm />} />
      <Route path="/editMovie/:id" element={<MovieForm />} />
      <Route path="/countries" element={<Countries />} />
      <Route path="/awards" element={<Awards />} />
      <Route path="/genres" element={<Genres />} />
      <Route path="/actors" element={<Actors />} />
      <Route path="/directors" element={<Directors />} />
      <Route path="/comments" element={<Comments />} />
      <Route path="/users" element={<Users />} />
    </Routes>
  );
}

export default AdminRoutes;