import React, { forwardRef } from 'react';
import { useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';

const DUMMY_TOKEN = process.env.REACT_APP_DUMMY_TOKEN || "default-dummy-token";

const Sidebar = forwardRef(({ open, setOpen }, ref) => {
  const role = Cookies.get('role');
  const token = Cookies.get('token') || "";

  // Create menus dynamically without mutating the array
  const Menus = [
    { title: "HOME", key: "home", path: "/Home" },
    { title: "NEWEST", key: "newest", path: "/Newest" },
    { title: "TOP RATED", key: "top-rated", path: "/TopRated" },
    { title: "CELEBS", key: "celebs", path: "/Celebs" },
    { title: "DIRECTORS", key: "directors", path: "/Directors" },
  ];

  // Add role-based menus
  if (token !== DUMMY_TOKEN && token) {
    if (role === 'admin') {
      Menus.push({ title: "CMS", key: "cms", path: "/admin/" });
    } else {
      Menus.push({ title: "ADD MOVIE", key: "add-movie", path: "/admin/addMovie" });
    }
  }

  return (
    <div
      ref={ref}
      className={`fixed top-0 left-0 w-72 h-full bg-gray-700 bg-opacity-75 transform ${open ? "translate-y-0" : "-translate-y-full"} transition-transform duration-300 ease-in-out z-50`}
    >
      <div className="bg-gray-700 w-72 h-screen p-5 pt-8 relative">
        <button
          className="absolute top-4 right-4 text-white text-2xl focus:outline-none"
          onClick={() => setOpen(false)}
        >
          &times;
        </button>
        <ul className="pt-2">
          {Menus.map((menu, index) => (
            <React.Fragment key={menu.key}>
              <MenuItem menu={menu} open={open} />
              {index < Menus.length - 1 && <hr className="border-t border-gray-600 my-2" />}
            </React.Fragment>
          ))}
        </ul>
      </div>
    </div>
  );
});

const MenuItem = ({ menu, open }) => {
  const navigate = useNavigate();

  // Handle navigation when a menu item is clicked
  const handleNavigation = (path) => {
    if (path) {
      navigate(path);
    } else {
      console.warn("Path tidak ditemukan untuk menu:", menu.title);
    }
  };

  const containerClass = "text-white text-md flex items-center gap-x-4 cursor-pointer p-2 hover:bg-light-white rounded-md mt-2";
  const menuClass = `text-base font-medium flex-1 ${!open && "hidden"}`;

  return (
    <li className={containerClass} onClick={() => handleNavigation(menu.path)}>
      <span className={menuClass}>{menu.title}</span>
    </li>
  );
};

export default Sidebar;
