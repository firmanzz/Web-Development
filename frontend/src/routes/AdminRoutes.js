import { Routes, Route } from "react-router-dom";
import MovieListCMS from "../pages/admin/MovieListCMS";
import MovieForm from "../pages/admin/MovieForm";
import Countries from "../pages/admin/Countries";
import Awards from "../pages/admin/Awards";
import Genres from "../pages/admin/Genres";
import Actors from "../pages/admin/Actors";
import Comments from "../pages/admin/Comments";
import Users from "../pages/admin/Users";

export default function AdminRoutes() {
  return (
    <Routes>
      <Route path="/" element={<MovieListCMS />} />
      <Route path="addMovie" element={<MovieForm />} />
      <Route path="editMovie/:id" element={<MovieForm />}/>
      <Route path="countries" element={<Countries />} />
      <Route path="Awards" element={<Awards />} />
      <Route path="Genres" element={<Genres />} />
      <Route path="Actors" element={<Actors />} />
      <Route path="Comments" element={<Comments />} />
      <Route path="Users" element={<Users />} />
    </Routes>
  );
}
