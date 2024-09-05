import { Routes, Route } from "react-router-dom";
import MovieListCMS from "../pages/admin/MovieListCMS";
import MovieForm from "../pages/admin/MovieForm";

export default function AdminRoutes() {
  return (
    <Routes>
      <Route path="/" element={<MovieListCMS />} />
      <Route path="addMovie" element={<MovieForm />} />
    </Routes>
  );
}
