import { Routes, Route } from "react-router-dom";

import MovieListCMS from "../pages/admin/MovieListCMS";

export default function AdminRoutes() {
    return (
      <Routes>

        <Route path="/" element={<MovieListCMS />}>
          <Route path="/" element={<MovieListCMS />} />
        </Route>
      </Routes>
    );
  }