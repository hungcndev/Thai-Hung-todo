import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faChevronDown,
  faUserCircle,
  faSignOutAlt,
} from "@fortawesome/free-solid-svg-icons";
import { Dropdown, Menu } from "antd";
import { useAuthContext } from "../../contexts/authStore";
import Avatar from "../../assets/rose.webp";
import Logo from "../../assets/Logo.png";
import "antd/dist/antd.css";
import { useNavigate } from "react-router";
import { Link } from "react-router-dom";

const menu = (handleLogout) => (
  <Menu
    items={[
      {
        key: "1",
        label: (
          <Link to="/account" className="text-base p-4">
            <FontAwesomeIcon
              icon={faUserCircle}
              className="mr-2 text-gray-600"
            />
            Details
          </Link>
        ),
      },
      {
        type: "divider",
      },
      {
        key: "2",
        label: (
          <div onClick={handleLogout} className="text-base px-4">
            <FontAwesomeIcon
              icon={faSignOutAlt}
              className="mr-2 text-gray-600"
            />
            Log out
          </div>
        ),
      },
    ]}
  />
);
export default function NavBar() {
  const { authContext, setToken } = useAuthContext();
  const navigate = useNavigate();

  const handleLogout = () => {
    setToken("");
    navigate("/login");
  };

  return (
    <nav className="flex justify-between h-[70px] items-center px-10 border-b border-gray-200">
      <div>
        <img src={Logo} alt="logo" width="160px" height="55px" />
      </div>

      {!authContext.token ? (
        <div className="flex justify-end items-center">
          <button
            onClick={() => navigate("/login")}
            className="font-semibold text-lg border-b border-gray-200 rounded-md py-1 px-7 bg-gray-200 text-black"
          >
            Log in
          </button>
          <button
            onClick={() => navigate("/signup")}
            className="font-semibold text-lg border-b border-red rounded-md py-1 px-7 ml-7 bg-red text-white"
          >
            Sign up
          </button>
        </div>
      ) : (
        <div className="flex items-center relative">
          <div className="mr-3 font-semibold">{authContext.user?.username}</div>
          <div className="rounded-full h-10 w-10 mr-2">
            <img
              src={Avatar}
              alt="User Avatar"
              className="rounded-full h-10 w-10 object-cover"
            />
          </div>
          <Dropdown
            overlay={menu(handleLogout)}
            placement="bottomRight"
            className="cursor-pointer"
          >
            <FontAwesomeIcon icon={faChevronDown} color="#42464B" />
          </Dropdown>
        </div>
      )}
    </nav>
  );
}
