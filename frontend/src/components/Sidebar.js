import React, { useEffect } from 'react';
import { useLocation } from 'react-router-dom';

const Sidebar = ({ open, setOpen }) => {
  const location = useLocation();

  useEffect(() => {
    // Check if the current route is either /login or /register
    if (location.pathname === '/login' || location.pathname === '/register') {
      setOpen(false); // Close the sidebar
    }
  }, [location.pathname, setOpen]); // Dependency array ensures this effect runs on path changes

  const Menus = [
    { title: "DASHBOARD", key: "dashboard" },
    {
      title: "COUNTRY",
      submenu: true,
      key: "country",
      submenuItem: [
        { title: "USA", key: "usa" },
        { title: "JAPAN", key: "japan" },
        { title: "CHINESE", key: "chinese" },
        { title: "KOREAN", key: "korean" },
        { title: "INDONESIA", key: "indonesia" },
        { title: "INDIAN", key: "indian" },
      ],
    },
    { title: "TRENDING", key: "trending" },
  ];

  return (
    <div className={`bg-gray-700 h-screen p-3 pt-6 ${open ? 'w-56' : 'hidden'} duration-300 relative`}>
      <ul className="pt-2">
        {Menus.map((menu, index) => (
          <React.Fragment key={menu.key}>
            <MenuItem menu={menu} open={open} />
            {index < Menus.length - 1 && <hr className="border-t border-gray-600 my-1" />}
          </React.Fragment>
        ))}
      </ul>
    </div>
  );
};

const MenuItem = ({ menu, open }) => {
  return (
    <>
      <li className="text-white text-sm flex items-center gap-x-3 cursor-pointer p-1.5 hover:bg-light-white rounded-md mt-1">
        <span className={`text-base font-medium flex-1 ${!open && 'hidden lg:block'}`}>{menu.title}</span>
      </li>
      {menu.submenu && open && (
        <SubMenu submenuItems={menu.submenuItem} />
      )}
    </>
  );
};

const SubMenu = ({ submenuItems }) => {
  return (
    <ul className="submenu pl-3">
      {submenuItems.map((submenuItem, index) => (
        <React.Fragment key={submenuItem.key}>
          <li className="text-white text-xs flex items-center gap-x-3 cursor-pointer p-1 px-4 hover:bg-light-white rounded-md">
            {submenuItem.title}
          </li>
          {index < submenuItems.length - 1 && <hr className="border-t border-gray-600 my-1" />}
        </React.Fragment>
      ))}
    </ul>
  );
};

export default Sidebar;
