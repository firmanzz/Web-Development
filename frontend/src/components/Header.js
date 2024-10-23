import { Link, useLocation, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import { FaUserCircle, FaDoorOpen } from "react-icons/fa"; // Import avatar dan logout icon
import Cookies from 'js-cookie';

const Header = ({ open, setOpen }) => {
  const location = useLocation();
  const navigate = useNavigate(); // Untuk redirect
  const [isAuthenticated, setIsAuthenticated] = useState(false); // Status login
  const [user, setUser] = useState(null); // Simpan data user

  // Cek apakah user sudah login dan ambil data user
  const getUserData = async () => {
    try {
      const token = Cookies.get("token"); // Ambil token dari cookies
      if (!token) throw new Error("No token found");

      const response = await fetch('http://localhost:5000/api/get-user', {
        method: 'GET',
        headers: {
          Authorization: `Bearer ${token}`, // Kirim token di header Authorization
          'Content-Type': 'application/json',
        },
      });

      if (!response.ok) {
        const errorMessage = await response.json();
        console.error('DATA USER:', errorMessage); // Debug respons server
        throw new Error('Failed to fetch user data');
      }

      const userData = await response.json();

      setUser(userData); // Simpan data user ke states
      setIsAuthenticated(true);
    } catch (error) {
      console.error(error);
      setIsAuthenticated(false);
      setUser(null);
    }
  };

  useEffect(() => {
    getUserData(); // Ambil data user saat komponen pertama kali dimuat
  }, []);

  const handleLogout = () => {
    Cookies.remove("token"); // Hapus token dari cookies
    setIsAuthenticated(false);
    setUser(null); // Reset state user
    navigate("/Login"); // Redirect ke halaman login
  };

  const handleAvatarClick = () => {
    if (!isAuthenticated) {
      navigate("/Login"); // Redirect ke halaman login jika belum login
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
        {isAuthenticated && (
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