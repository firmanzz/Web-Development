import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Login form submitted");

    // Periksa pengguna dari localStorage
    const users = JSON.parse(localStorage.getItem('users')) || [];
    const user = users.find(user => user.username === username && user.password === password);

    if (user) {
      // Menyimpan token ke localStorage untuk simulasi autentikasi
      localStorage.setItem('token', 'dummyToken');
      console.log("Login successful, token saved");
      navigate('/admin'); // Arahkan ke halaman admin setelah login berhasil
    } else {
      alert('Username atau password salah!');
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen px-4 bg-gray-800">
      <div className="w-full max-w-xs p-6 bg-white rounded shadow-md">
        <h2 className="mb-4 text-xl font-bold text-center">MasterFilm</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <label className="block mb-1 text-sm font-bold text-gray-700" htmlFor="username">
              Username
            </label>
            <input
              type="text"
              id="username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              className="w-full px-2 py-1.5 border rounded shadow appearance-none focus:outline-none focus:ring focus:border-blue-300 text-sm"
            />
          </div>
          <div className="mb-4">
            <label className="block mb-1 text-sm font-bold text-gray-700" htmlFor="password">
              Password
            </label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="w-full px-2 py-1.5 border rounded shadow appearance-none focus:outline-none focus:ring focus:border-blue-300 text-sm"
            />
          </div>
          <button
            type="submit"
            className="w-full px-3 py-1.5 font-bold text-white bg-orange-500 rounded hover:bg-orange-600 focus:outline-none focus:ring focus:border-blue-300 text-sm"
          >
            Sign In
          </button>
        </form>
        <p className="mt-3 text-center text-sm text-gray-600">
          Don't have an account?{' '}
          <Link to="/admin/register" className="text-blue-500 hover:underline">
            Register
          </Link>
        </p>
      </div>
    </div>
  );
};

export default Login;
