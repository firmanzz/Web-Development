import { BsArrowLeftShort, BsChevronDown } from "react-icons/bs";
import { FiAirplay } from "react-icons/fi";
import { AiOutlineBank, AiFillFlag, AiFillFire } from "react-icons/ai";

const Sidebar = ({ open, setOpen, submenuOpen, setSubmenuOpen }) => {
  const Menus = [
    { title: "DASHBOARD", icon: <AiOutlineBank /> },
    {
      title: "COUNTRY",
      icon: <AiFillFlag />,
      submenu: true,
      submenuItem: [
        { title: "USA" },
        { title: "JAPAN" },
        { title: "CHINESE" },
        { title: "KOREAN" },
        { title: "INDONESIA" },
        { title: "INDIAN" },
      ],
    },
    { title: "TRENDING", icon: <AiFillFire /> },
  ];

  return (
    <div className={`bg-dark-purple h-screen p-5 pt-8 ${open ? "w-72" : "w-20"} duration-300 relative`}>
      <BsArrowLeftShort
        className={`bg-white text-dark-purple text-3xl rounded-full absolute -right-3 top-12 border border-dark-purple cursor-pointer ${!open && "rotate-180"}`}
        onClick={() => setOpen(!open)}
      />
      <div className="inline-flex">
        <FiAirplay
          className={`bg-lime-300 text-4xl rounded cursor-pointer block float-left mr-2 duration-500 ${open && "rotate-[360deg]"}`}
        />
        <h1 className={`text-white origin-left font-medium text-4xl duration-300 ${!open && "scale-0"}`}>
          Dramaku
        </h1>
      </div>
      <ul className="pt-2">
        {Menus.map((menu, index) => (
          <>
            <li
              key={index}
              className={`text-black text-md flex items-center gap-x-4 cursor-pointer p-2 hover:bg-light-white rounded-md ${menu.spacing ? "mt-9" : "mt-2"} mt-2`}
            >
              <span className="text-4xl block float-left">{menu.icon}</span>
              <span className={`text-base font-medium flex-1 ${!open && "hidden"}`}>{menu.title}</span>
              {menu.submenu && (
                <BsChevronDown className={`${submenuOpen && "rotate-180"}`} onClick={() => setSubmenuOpen(!submenuOpen)} />
              )}
            </li>
            {menu.submenu && submenuOpen && open && (
              <ul>
                {menu.submenuItem.map((submenuItem, index) => (
                  <li key={index} className="text-black text-md flex items-center gap-x-4 cursor-pointer p-2 px-5 hover:bg-light-white rounded-md">
                    {submenuItem.title}
                  </li>
                ))}
              </ul>
            )}
          </>
        ))}
      </ul>
    </div>
  );
};

export default Sidebar;
