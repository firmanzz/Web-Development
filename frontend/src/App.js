import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import Home from "./pages/Home";
import Celebs from "./pages/Celebs";
import Directors from "./pages/Directors";
import TopRated from "./pages/TopRated";
import Newest from "./pages/Newest";
import MovieDetail from "./pages/MovieDetail";
import AdminRoutes from "./routes/AdminRoutes";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/Newest" element={<Newest />} />
        <Route path="/TopRated" element={<TopRated />} />
        <Route path="/Celebs" element={<Celebs />} />
        <Route path="/Directors" element={<Directors />} />
        <Route path="/details/:id" element={<MovieDetail />} />
        <Route path="/admin/*" element={<AdminRoutes />} />
      </Routes>
    </Router>
  );
}

export default App;
