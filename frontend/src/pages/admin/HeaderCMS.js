import { Link, useLocation } from "react-router-dom";
import { useEffect, useState } from "react";
import { FaDoorOpen, FaUserCircle } from "react-icons/fa"; // Import icon avatar

const HeaderCMS = ({ open, setOpen }) => {
  const location = useLocation();
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null); // Simpan data user

  // Fungsi untuk mengambil data user dari backend
  const getUserData = async () => {
    try {
      const token = localStorage.getItem('token'); // Ambil token dari Local Storage
      if (!token) throw new Error('No token found');

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
      console.log('User Data:', userData); // Debug respons user

      setUser(userData); // Simpan data user ke state
      setIsAuthenticated(true);
    } catch (error) {
      console.error(error);
      setIsAuthenticated(false);
      window.location.href = '/Login'; // Redirect jika token tidak valid
    }
  };

  useEffect(() => {
    getUserData(); // Ambil data user saat komponen pertama kali dimuat
  }, []);

  const handleLogout = () => {
    localStorage.removeItem('token'); // Hapus token
    setIsAuthenticated(false);
    setUser(null); // Reset state user
    window.location.href = '/Login'; // Redirect ke halaman login
  };

  return (
    <header className="bg-gray-700 text-white text-3xl p-4 flex sticky top-0 z-50">
      {location.pathname !== '/Login' && location.pathname !== '/Register' && (
        <button
          className="text-white md:px-14 text-2xl focus:outline-none"
          onClick={() => setOpen(!open)}
        >
          &#9776;
        </button>
      )}
      <div className="flex-1 flex justify-center items-center mx-4">
        <Link
          to="/admin/"
          className="text-3xl font-bold text-white"
          style={{ fontFamily: 'Playfair Display, serif' }}
        >
          MasterMovie Admin
        </Link>
      </div>

      <div className="flex items-center space-x-4">
        {isAuthenticated && user ? (
          <div className="flex items-center space-x-2">
            <FaUserCircle className="text-white text-3xl" /> {/* Avatar */}
            <span className="text-lg font-medium" style={{ fontFamily: 'Arial, sans-serif' }}>
              {user.name}
            </span>
            <FaDoorOpen
              onClick={handleLogout}
              className="text-white text-2xl cursor-pointer hover:text-red-400"
            />
          </div>
        ) : null}
      </div>
    </header>
  );
};

export default HeaderCMS;
