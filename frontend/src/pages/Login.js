import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      console.log("EMAIL: ", email);
      console.log("PASSWORD: ", password);

      const response = await fetch('http://localhost:5000/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });

      const data = await response.json();
      console.log("DATA: ", data);

      if (response.ok) {
        localStorage.setItem('token', data.token);
        alert('Login successful!');
        window.location.href = '/admin';
      } else {
        alert('Login failed: ' + data.message);
      }
    } catch (error) {
      console.log(error);
      alert('Login failed: Server error');
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen px-4 bg-gray-800">
      <div className="w-full max-w-xs p-6 bg-white rounded shadow-md">
        <h2 className="mb-4 text-xl font-bold text-center">MasterFilm</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-3">
            <label className="block mb-1 text-sm font-bold text-gray-700" htmlFor="email">
              Email
            </label>
            <input
              type="email"
              id="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
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
        <p className="mt-1 text-center text-sm text-gray-600">
          Forgot your password?{' '}
          <a href="http://localhost:3000/admin/forgot-password" className="text-blue-500 hover:underline">
            Click here
          </a>
        </p>
      </div>
    </div>
  );
};

export default Login;
