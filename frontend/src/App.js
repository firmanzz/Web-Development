import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import MovieList from "./pages/Home";
import Login from "./pages/Login";
import AdminRoutes from "./routes/AdminRoutes";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<MovieList />} />
        <Route path="/login" element={<Login />} />
        <Route path="/admin/*" element={<AdminRoutes />} />
      </Routes>
    </Router>
  );
}

export default App;
