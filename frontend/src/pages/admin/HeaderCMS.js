import { Link, useLocation } from "react-router-dom";

const Header = ({ open, setOpen }) => {
  const location = useLocation();

  return (
    <header className="bg-gray-700 text-white text-3xl p-4 flex sticky top-0 z-50">
      {location.pathname !== "/login" && location.pathname !== "/register" && (
        <button
          className="text-white md:px-14 text-2xl focus:outline-none"
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
          MasterMovie Admin
        </Link>
      </div>
    </header>
  );
};

export default Header;
