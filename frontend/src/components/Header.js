const Header = ({ open, setOpen }) => {
  return (
    <header className="bg-gray-700 text-white text-3xl p-4 text-center mb-8">
      <button
        className="text-white text-2xl focus:outline-none"
        onClick={() => setOpen(!open)}
      >
        &#9776;
      </button>
      <span className="ml-4">Dramaku</span>
    </header>
  );
};

export default Header;
