import { BsSearch } from "react-icons/bs";

const SearchBar = () => {
  return (
    <div className="flex items-center rounded-md bg-gray-200 px-3 py-1.5 w-full sm:w-64 mb-4 mt-2">
      <BsSearch className="text-black text-md cursor-pointer mr-2" />
      <input
        type="text"
        placeholder="Search..."
        className="bg-transparent outline-none text-black flex-1 text-sm"
      />
    </div>
  );
};

export default SearchBar;
