import { BrowserRouter as Router, Route, Routes, Navigate } from "react-router-dom";
import Home from "./pages/Home";
import Celebs from "./pages/Celebs";
import Directors from "./pages/Directors";
import TopRated from "./pages/TopRated";
import Newest from "./pages/Newest";
import MovieDetail from "./pages/MovieDetail";
import AdminRoutes from "./routes/AdminRoutes";
import Login from "./pages/Login";
import Register from "./pages/Register";
import ForgotPassword from "./pages/admin/ForgotPassword";
import GoogleAuth from "./pages/GoogleAuth";
import MovieForm from "./pages/admin/MovieForm";
import Cookies from 'js-cookie';

const DUMMY_TOKEN = process.env.REACT_APP_DUMMY_TOKEN;

function App() {
  const role = Cookies.get('role');
  const token = Cookies.get('token');

  return (  
    <Router>
      <Routes>
        <Route path="*" element={<Navigate to="/Login" />} />
        <Route path="/Login" element={<Login />} />
        <Route path="/Register" element={<Register />} />
        <Route path="/forgot-password" element={<ForgotPassword />} />
        <Route path="/Home" element={<Home />} />
        <Route path="/Newest" element={<Newest />} />
        <Route path="/TopRated" element={<TopRated />} />
        <Route path="/Celebs" element={<Celebs />} />
        <Route path="/Directors" element={<Directors />} />
        <Route path="/details/:id" element={<MovieDetail />} />
        
        {/* Route for Admin and Authenticated Users */}
        {role === 'admin' && <Route path="/admin/*" element={<AdminRoutes />} />}
        {role !== 'admin' && token !== DUMMY_TOKEN && <Route path="/admin/addMovie" element={<MovieForm />} />}
        
        <Route path="/google-auth" element={<GoogleAuth />} />
        
        {/* Redirect if user is not admin or editor */}
        {role !== 'admin' && role !== 'editor' && <Route path="/admin/*" element={<Navigate to="/Home" />} />}
      </Routes>
    </Router>
  );
}

export default App;
