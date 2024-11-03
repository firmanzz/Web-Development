import { Link, useLocation, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import { FaUserCircle, FaDoorOpen } from "react-icons/fa";
import Cookies from 'js-cookie';

const DUMMY_TOKEN = process.env.REACT_APP_DUMMY_TOKEN;

const Header = ({ open, setOpen }) => {
  const location = useLocation();
  const navigate = useNavigate();
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null);

  const getUserData = async () => {
    const token = Cookies.get("token");

    console.log("Token dari Cookies:", token);
    console.log("DUMMY_TOKEN dari .env:", DUMMY_TOKEN);

    // Check if token is the dummy token
    if (token === DUMMY_TOKEN) {
      setUser({ name: "Guest" });
      setIsAuthenticated(true);
      return;
    }

    try {
      if (!token) throw new Error("No token found");

      const response = await fetch('http://localhost:5000/api/get-user', {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${token}`,
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        throw new Error('Failed to fetch user data');
      }

      const userData = await response.json();
      setUser(userData);
      setIsAuthenticated(true);
    } catch (error) {
      console.error(error);
      setIsAuthenticated(false);
      setUser(null);
    }
  };

  useEffect(() => {
    getUserData();
  }, []);

  const handleLogout = () => {
    Cookies.remove("token");
    Cookies.remove("role");
    Cookies.remove("userid");
    setIsAuthenticated(false);
    setUser(null);
    navigate("/Login"); // Redirect to login page
  };

  const handleAvatarClick = () => {
    if (!isAuthenticated || user?.name === "Guest") {
      handleLogout();
    }
  };

  return (
    <header className="bg-gray-700 text-white text-3xl p-4 flex sticky top-0 z-50">
      {location.pathname !== "/Login" && location.pathname !== "/Register" && (
        <button
          className="text-white text-2xl focus:outline-none"
          onClick={() => setOpen(!open)}
        >
          &#9776;
        </button>
      )}

      <div className="flex-1 flex justify-center items-center">
        <Link
          to="/"
          className="text-3xl font-bold text-white"
          style={{ fontFamily: "Playfair Display, serif" }}
        >
          MasterMovie
        </Link>
      </div>

      <div className="flex items-center space-x-4 cursor-pointer" onClick={handleAvatarClick}>
        <FaUserCircle className="text-white text-4xl" /> {/* Avatar */}
        <span className="text-lg font-medium text-white" style={{ fontFamily: 'Arial, sans-serif' }}>
          {user ? user.name : "Guest"}
        </span>
        {isAuthenticated && user?.name !== "Guest" && (
          <FaDoorOpen
            onClick={handleLogout}
            className="text-white text-2xl cursor-pointer hover:text-red-400"
          />
        )}
      </div>
    </header>
  );
};

export default Header;
