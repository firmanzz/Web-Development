import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search);
    const token = urlParams.get('token');
    const role = urlParams.get('role');
  
    if (token) {
      Cookies.set('token', token);
      if (role) {
        Cookies.set('role', role);
      }
  
      if (role === 'admin') {
        navigate('/admin');
      } else {
        navigate('/');
      }
    }
  }, [navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('http://localhost:5000/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, password }),
      });
  
      const data = await response.json();
      
      if (response.ok) {
        Cookies.set('token', data.token);
        Cookies.set('role', data.data.role);
        alert('Login successful!');

        if (data.data.role === 'admin') {
          window.location.href = '/admin';
        } else if (data.data.role === 'editor') {
          window.location.href = '/';
        } else {
          alert('Unknown role');
        }
      } else {
        alert('Login failed: ' + data.message);
      }
    } catch (error) {
      console.error('Error during login:', error);
      alert('Login failed: Server error');
    }
  };

  const googleSignIn = () => {
    window.location.href = 'http://localhost:5000/api/auth/google';
  };

  const handleGuestLogin = async () => {
    try {
      const response = await fetch('http://localhost:5000/api/guest', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      const { token } = await response.json();
      Cookies.set('token', token);
      navigate('/');
    } catch (error) {
      console.error('Error during guest login:', error);
      alert('Guest login failed');
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
        <button
          onClick={googleSignIn}
          className="w-full px-3 py-1.5 mt-2 font-bold text-white bg-red-500 rounded hover:bg-red-600 focus:outline-none focus:ring focus:border-blue-300 text-sm"
        >
          Sign in with Google
        </button>
        <p className="mt-3 text-center text-sm text-gray-600">
          Don't have an account?{' '}
          <Link to="/Register" className="text-blue-500 hover:underline">
            Register
          </Link>
        </p>
        <p className="mt-1 text-center text-sm text-gray-600">
          Forgot your password?{' '}
          <a href="http://localhost:3000/forgot-password" className="text-blue-500 hover:underline">
            Click here
          </a>
        </p>
        <p className="mt-1 text-center text-sm text-gray-600">
          Just Looking Around?{' '}
          <span onClick={handleGuestLogin} className="text-blue-500 hover:underline cursor-pointer">
            Continue as Guest
          </span>
        </p>
      </div>
    </div>
  );
};

export default Login;