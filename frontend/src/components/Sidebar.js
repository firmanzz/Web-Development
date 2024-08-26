import React from 'react';

const Sidebar = ({ open }) => {
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
    <div className={`bg-gray-700 h-screen p-5 pt-8 ${open ? 'w-72' : 'hidden'} duration-300 relative`}>
      <ul className="pt-2">
        {Menus.map((menu) => (
          <MenuItem key={menu.key} menu={menu} open={open} />
        ))}
      </ul>
    </div>
  );
};

const MenuItem = ({ menu, open }) => {
  return (
    <>
      <li className="text-white text-md flex items-center gap-x-4 cursor-pointer p-2 hover:bg-light-white rounded-md mt-2">
        <span className={`text-base font-medium flex-1 ${!open && 'hidden'}`}>{menu.title}</span>
      </li>
      {menu.submenu && open && (
        <SubMenu submenuItems={menu.submenuItem} />
      )}
    </>
  );
};

const SubMenu = ({ submenuItems }) => {
  return (
    <ul className="submenu pl-4">
      {submenuItems.map((submenuItem) => (
        <li key={submenuItem.key} className="text-white text-md flex items-center gap-x-4 cursor-pointer p-2 px-5 hover:bg-light-white rounded-md">
          {submenuItem.title}
        </li>
      ))}
    </ul>
  );
};

export default Sidebar;
