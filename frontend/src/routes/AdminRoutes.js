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
import Cookies from 'js-cookie';

const AdminRoutes = () => {
  const token = Cookies.get('token'); 
  const role = Cookies.get('role');

  if (!token) {
    return <Navigate to="/Login" />;
  }

  return (
    <Routes>
      {/* Admin routes */}
      {role === 'admin' && (
        <>
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
        </>
      )}

      {/* Editor routes */}
      {role === 'editor' && (
        <Route path="/addMovie" element={<MovieForm />} />  // Editor hanya bisa akses menambah film
      )}

      {/* Default redirect */}
      <Route path="*" element={<Navigate to="/admin/addMovie" />} />
    </Routes>
  );
}

export default AdminRoutes;