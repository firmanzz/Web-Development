import { Link, useLocation } from 'react-router-dom';

const Header = ({ open, setOpen }) => {
  const location = useLocation();

  return (
    <header className="bg-gray-700 text-white text-3xl p-4 flex items-center justify-between">
      {location.pathname !== '/login' && location.pathname !== '/register' && (
        <button
          className="text-white text-2xl focus:outline-none absolute left-50"
          onClick={() => setOpen(!open)}
        >
          &#9776;
        </button>
      )}
      <div className="flex-1 flex justify-center"> 
      <Link to="/">
          <img 
            src="/assets/logo.png" 
            alt="MisterFilm Logo" 
            className="h-12 w-30" 
          />
        </Link>
      </div>
      <div className="flex items-center space-x-2">
        {/* Dropdown untuk pemilihan bahasa */}
        <div className="relative">
          <select
            className="text-white bg-gray-600 hover:bg-gray-500 px-2 py-1 text-sm rounded flex items-center"
            style={{ appearance: 'none' }}
          >
            <option value="en">🌐 English</option>
            <option value="id">🌐 Bahasa Indonesia</option>
          </select>
        </div>

        {/* Link ke halaman Login dan Sign Up */}
        <Link to="/login" className="text-white bg-blue-500 hover:bg-blue-400 px-3 py-1 text-sm rounded">
          Login
        </Link>
        <Link to="/register" className="text-white bg-green-500 hover:bg-green-400 px-3 py-1 text-sm rounded">
          Sign Up
        </Link>
      </div>
    </header>
  );
};

export default Header;
