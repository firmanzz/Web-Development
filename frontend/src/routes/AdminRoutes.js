import { Routes, Route, Navigate } from "react-router-dom";
import MovieListCMS from "../pages/admin/MovieListCMS";
import MovieForm from "../pages/admin/MovieForm";
import Countries from "../pages/admin/Countries";
import Awards from "../pages/admin/Awards";
import Genres from "../pages/admin/Genres";
import Availability from "../pages/admin/Availabilities";
import Actors from "../pages/admin/Actors";
import Directors from "../pages/admin/Directors";
import Comments from "../pages/admin/Comments";
import Users from "../pages/admin/Users";
import Cookies from 'js-cookie';

const DUMMY_TOKEN = process.env.REACT_APP_DUMMY_TOKEN;

const AdminRoutes = () => {
  const token = Cookies.get('token');
  const role = Cookies.get('role');

  // Redirect guests to home if they try to access admin pages
  if (!token || token === DUMMY_TOKEN) {
    return <Navigate to="/" />;
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
          <Route path="/availabilities" element={<Availability />} />
          <Route path="/actors" element={<Actors />} />
          <Route path="/directors" element={<Directors />} />
          <Route path="/comments" element={<Comments />} />
          <Route path="/users" element={<Users />} />
        </>
      )}

      {/* Editor routes */}
      {role !== 'admin' && <Route path="/admin/addMovie" element={<MovieForm />} />}

      {/* Default redirect */}
      <Route path="*" element={<Navigate to="/admin/addMovie" />} />
    </Routes>
  );
}

export default AdminRoutes;
