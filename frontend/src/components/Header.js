import { Link, useLocation } from "react-router-dom";

const Header = ({ open, setOpen }) => {
  const location = useLocation();

  return (
    <header className="bg-gray-700 text-white text-3xl p-4 flex sticky top-0 z-50">
      {location.pathname !== "/login" && location.pathname !== "/register" && (
        <button
          className="text-white px-1 md:px-14 text-2xl focus:outline-none"
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
      <div className="flex items-center space-x-2">
        <Link
          to="/login"
          className="text-white bg-blue-500 hover:bg-blue-400 px-3 py-1 text-sm rounded"
        >
          Login
        </Link>
        <Link
          to="/register"
          className="text-white bg-green-500 hover:bg-green-400 px-3 py-1 text-sm rounded"
        >
          Sign Up
        </Link>
      </div>
    </header>
  );
};

export default Header;
