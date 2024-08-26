import React, { useState } from 'react';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Username:', username);
    console.log('Password:', password);
  };

  return (
    <div className="flex items-center justify-center">
      <div className="w-full max-w-sm p-8 bg-white rounded shadow-md mt-8 mb-8">
        <h2 className="mb-6 text-2xl font-bold text-center">MisterFilm</h2>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label className="block mb-2 text-sm font-bold text-gray-700" htmlFor="username">
              Username
            </label>
            <input
              type="text"
              id="username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              className="w-full px-3 py-2 border rounded shadow appearance-none focus:outline-none focus:ring focus:border-blue-300"
            />
          </div>
          <div className="mb-6">
            <label className="block mb-2 text-sm font-bold text-gray-700" htmlFor="password">
              Password
            </label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="w-full px-3 py-2 border rounded shadow appearance-none focus:outline-none focus:ring focus:border-blue-300"
            />
          </div>
          <div className="flex items-center justify-between">
            <button
              type="submit"
              className="w-full px-4 py-2 mb-4 font-bold text-white bg-orange-500 rounded hover:bg-orange-600 focus:outline-none focus:ring focus:border-blue-300"
            >
              Sign In
            </button>
          </div>
          <div className="flex items-center justify-between">
            <button
              type="button"
              className="w-full px-4 py-2 font-bold text-white bg-orange-400 rounded hover:bg-orange-500 focus:outline-none focus:ring focus:border-blue-300"
            >
              Sign in with Google
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
