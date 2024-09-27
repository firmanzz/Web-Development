import React, { forwardRef } from 'react';

const Sidebar = forwardRef(({ open, setOpen }, ref) => {
  const Menus = [
    { title: "DASHBOARD", key: "dashboard" },
    {
      title: "COUNTRY",
      key: "country"},
    { title: "TRENDING", key: "trending" },
  ];

  return (
    <div
      ref={ref}
      className={`fixed top-0 left-0 w-72 h-full bg-gray-700 bg-opacity-75 transform ${
        open ? 'translate-y-0' : '-translate-y-full'
      } transition-transform duration-300 ease-in-out z-50`}
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
