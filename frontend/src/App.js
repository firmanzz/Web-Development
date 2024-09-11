import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import MovieList from "./pages/Home";
import MovieDetail from "./pages/MovieDetail";
import AdminRoutes from "./routes/AdminRoutes";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<MovieList />} />
        <Route path="/details/:id" element={<MovieDetail />} />
        <Route path="/admin/*" element={<AdminRoutes />} />
      </Routes>
    </Router>
  );
}

export default App;
