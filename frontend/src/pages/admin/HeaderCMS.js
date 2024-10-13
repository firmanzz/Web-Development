import { Link, useLocation } from "react-router-dom";
import { useEffect, useState } from "react";
import { FaDoorOpen } from "react-icons/fa";

const Header = ({ open, setOpen }) => {
  const location = useLocation();
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [username, setUsername] = useState("");

  useEffect(() => {
    const token = localStorage.getItem("token");
    const users = JSON.parse(localStorage.getItem("users")) || [];
    if (token === "dummyToken") {
      setIsAuthenticated(true);
      const currentUser = users.find((user) => user.username && token === 'dummyToken');
      if (currentUser) {
        setUsername(currentUser.username);
      }
    } else {
      setIsAuthenticated(false);
      setUsername("");
    }
  }, [isAuthenticated]);

  const handleLogout = () => {
    localStorage.removeItem("token");
    setIsAuthenticated(false);
    setUsername("");
    window.location.href = "/admin/login/";
  };

  return (
    <header className="bg-gray-700 text-white text-3xl p-4 flex sticky top-0 z-50">
      {location.pathname !== "/login/" && location.pathname !== "/register/" && (
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
          style={{ fontFamily: "Playfair Display, serif" }}
        >
          MasterMovie Admin
        </Link>
      </div>
      <div className="flex items-center space-x-2">
        {isAuthenticated ? (
          <>
            <span>{username}</span>
            <FaDoorOpen
              onClick={handleLogout}
              className="text-white text-2xl cursor-pointer hover:text-red-400"
            />
          </>
        ) : (
          <>
            <Link
              to="/admin/login/"
              className="text-white bg-blue-500 hover:bg-blue-400 px-3 py-1 text-sm rounded"
            >
              Login
            </Link>
            <Link
              to="/admin/register/"
              className="text-white bg-green-500 hover:bg-green-400 px-3 py-1 text-sm rounded"
            >
              Sign Up
            </Link>
          </>
        )}
      </div>
    </header>
  );
};

export default Header;