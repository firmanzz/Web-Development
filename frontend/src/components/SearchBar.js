import { BsSearch } from "react-icons/bs";

const SearchBar = () => {
  return (
    <div className="flex items-center rounded-md bg-gray-200 px-4 py-2 w-80 mb-6">
      <BsSearch className="text-black text-lg cursor-pointer mr-2" />
      <input
        type="text"
        placeholder="Search..."
        className="bg-transparent outline-none text-black flex-1"
      />
    </div>
  );
};

export default SearchBar;
