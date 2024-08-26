const Header = ({ open, setOpen }) => {
  return (
    <header className="bg-gray-700 text-white text-3xl p-4 flex items-center">
      <button
        className="text-white text-2xl focus:outline-none absolute left-4"
        onClick={() => setOpen(!open)}
      >
        &#9776;
      </button>
      <div className="flex-1 flex justify-center">
        <span className="text-4xl font-bold">MisterFilm</span>
      </div>
    </header>
  );
};

export default Header;
