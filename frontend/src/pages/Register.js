import React, { useState, useEffect, useCallback } from 'react';
import { Link, useNavigate, useLocation } from 'react-router-dom';

const Register = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [code, setCode] = useState('');
  const [isRegistered, setIsRegistered] = useState(false); // Tahap registrasi atau verifikasi
  const [message, setMessage] = useState('');
  const navigate = useNavigate();
  const location = useLocation(); // To detect URL changes

  // Fungsi untuk menghapus akun unverified jika keluar
  const handleDeleteUnverified = useCallback(async () => {
    if (isRegistered && email) {
      try {
        const response = await fetch('http://localhost:5000/api/delete-unverified', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ email }),
        });

        if (!response.ok) {
          console.error('Failed to delete unverified user');
        } else {
          console.log('Unverified user deleted successfully');
        }
      } catch (error) {
        console.error('Error deleting unverified user:', error);
      }
    }
  }, [isRegistered, email]);

  // Efek untuk menangani refresh atau navigasi keluar
  useEffect(() => {
    const handleBeforeUnload = (e) => {
      if (isRegistered && email) {
        e.preventDefault();
        handleDeleteUnverified();
        e.returnValue = ''; // Chrome membutuhkan ini agar event beforeunload bekerja
      }
    };

    // Tambahkan event listener untuk refresh
    window.addEventListener('beforeunload', handleBeforeUnload);

    // Deteksi navigasi keluar dari halaman
    return () => {
      window.removeEventListener('beforeunload', handleBeforeUnload);
      handleDeleteUnverified(); // Call on component unmount
    };
  }, [isRegistered, email, handleDeleteUnverified]);

  // Deteksi perubahan URL dengan `useLocation`
  useEffect(() => {
    return () => {
      if (isRegistered && email) {
        handleDeleteUnverified();
      }
    };
  }, [location, isRegistered, email, handleDeleteUnverified]);

  // Fungsi untuk registrasi user dan kirim kode verifikasi
  const handleRegister = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('http://localhost:5000/api/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ name, email, password }),
      });

      const data = await response.json();
      if (response.ok) {
        setIsRegistered(true); // Beralih ke form verifikasi
        setMessage('Check your email for the verification code.');
      } else {
        setMessage(data.message);
      }
    } catch (error) {
      console.error(error);
      setMessage('Registration failed. Please try again.');
    }
  };

  const handleVerify = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('http://localhost:5000/api/verify-email', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ email, code }),
      });

      const data = await response.json();
      if (response.ok) {
        setMessage('Verification successful! Redirecting to login...');
        setTimeout(() => {
          navigate('/Login');
        }, 2000);
      } else {
        setMessage(data.message);
      }
    } catch (error) {
      console.error(error);
      setMessage('Verification failed. Please try again.');
    }
  };

  const googleSignIn = () => {
    window.location.href = 'http://localhost:5000/api/auth/google';
  };

  return (
    <div className="flex items-center justify-center min-h-screen px-4 bg-gray-800">
      <div className="w-full max-w-xs p-6 bg-white rounded shadow-md">
        <h2 className="mb-4 text-xl font-bold text-center">MasterFilm</h2>

        {isRegistered ? (
          <form onSubmit={handleVerify}>
            <p className="mb-3 text-center text-sm text-gray-600">{message}</p>
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
            <button
              type="submit"
              className="w-full px-3 py-1.5 font-bold text-white bg-orange-500 rounded hover:bg-orange-600 focus:outline-none focus:ring focus:border-blue-300 text-sm"
            >
              Verify
            </button>
          </form>
        ) : (
          <form onSubmit={handleRegister}>
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
              Sign Up
            </button>
          </form>
        )}

        <button
          onClick={googleSignIn}
          className="w-full px-3 py-1.5 mt-3 font-bold text-white bg-red-500 rounded hover:bg-red-600 focus:outline-none focus:ring focus:border-blue-300 text-sm"
        >
          Sign in with Google
        </button>

        <p className="mt-3 text-center text-sm text-gray-600">
          Already have an account?{' '}
          <Link to="/Login" className="text-blue-500 hover:underline">
            Login
          </Link>
        </p>
      </div>
    </div>
  );
};

export default Register;
