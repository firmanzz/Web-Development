import React from 'react';
import { useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';

const Logout = () => {
  const navigate = useNavigate();

  const handleLogout = () => {
    Cookies.remove('token');
    Cookies.remove('role');
    Cookies.remove('userid');
    navigate('/Login');
  };

  return <button onClick={handleLogout}>Logout</button>;
};

export default Logout;