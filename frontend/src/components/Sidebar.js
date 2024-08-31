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
        {Menus.map((menu, index) => (
          <React.Fragment key={menu.key}>
            <MenuItem menu={menu} open={open} />
            {index < Menus.length - 1 && <hr className="border-t border-gray-600 my-2" />}
          </React.Fragment>
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
      {submenuItems.map((submenuItem, index) => (
        <React.Fragment key={submenuItem.key}>
          <li className="text-white text-sm flex items-center gap-x-4 cursor-pointer p-2 px-5 hover:bg-light-white rounded-md">
            {submenuItem.title}
          </li>
          {index < submenuItems.length - 1 && <hr className="border-t border-gray-600 my-2" />}
        </React.Fragment>
      ))}
    </ul>
  );
};

export default Sidebar;
