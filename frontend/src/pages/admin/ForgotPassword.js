import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const ForgotPassword = () => {
  const [email, setEmail] = useState('');
  const [name, setName] = useState('');
  const [code, setCode] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [step, setStep] = useState(1);

  const handleForgotPassword = async () => {
    try {
      const response = await fetch('http://localhost:5000/api/forgot-password', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, name }),
      });

      const data = await response.json();
      alert(data.message);
      if (response.ok) setStep(2);
    } catch (error) {
      console.log(error);
    }
  };

  const handleResetPassword = async () => {
    try {
      const response = await fetch('http://localhost:5000/api/reset-password', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, code, newPassword }),
      });

      const data = await response.json();
      alert(data.message);
      if (response.ok) window.location.href = '/admin/login';
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div className="flex items-center justify-center min-h-screen px-4 bg-gray-800">
      <div className="w-full max-w-xs p-6 bg-white rounded shadow-md">
        {step === 1 ? (
          <div>
            <h2 className="mb-4 text-xl font-bold text-center">Forgot Password</h2>
            <div className="mb-3">
              <label className="block mb-1 text-sm font-bold text-gray-700" htmlFor="name">
                Name
              </label>
              <input
                type="text"
                id="name"
                value={name}
                onChange={(e) => setName(e.target.value)}
                className="w-full px-2 py-1.5 border rounded shadow appearance-none focus:outline-none focus:ring focus:border-blue-300 text-sm"
              />
            </div>
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
            <button
              onClick={handleForgotPassword}
              className="w-full px-3 py-1.5 font-bold text-white bg-orange-500 rounded hover:bg-orange-600 focus:outline-none focus:ring focus:border-blue-300 text-sm"
            >
              Send Verification Code
            </button>
          </div>
        ) : (
          <div>
            <h2 className="mb-4 text-xl font-bold text-center">Reset Password</h2>
            <div className="mb-3">
              <label className="block mb-1 text-sm font-bold text-gray-700" htmlFor="code">
                Verification Code
              </label>
              <input
                type="text"
                id="code"
                value={code}
                onChange={(e) => setCode(e.target.value)}
                className="w-full px-2 py-1.5 border rounded shadow appearance-none focus:outline-none focus:ring focus:border-blue-300 text-sm"
              />
            </div>
            <div className="mb-3">
              <label className="block mb-1 text-sm font-bold text-gray-700" htmlFor="newPassword">
                New Password
              </label>
              <input
                type="password"
                id="newPassword"
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
                className="w-full px-2 py-1.5 border rounded shadow appearance-none focus:outline-none focus:ring focus:border-blue-300 text-sm"
              />
            </div>
            <button
              onClick={handleResetPassword}
              className="w-full px-3 py-1.5 font-bold text-white bg-orange-500 rounded hover:bg-orange-600 focus:outline-none focus:ring focus:border-blue-300 text-sm"
            >
              Reset Password
            </button>
          </div>
        )}
        <p className="mt-3 text-center text-sm text-gray-600">
          Remember your password?{' '}
          <Link to="/admin/login" className="text-blue-500 hover:underline">
            Login
          </Link>
        </p>
      </div>
    </div>
  );
};

export default ForgotPassword;
