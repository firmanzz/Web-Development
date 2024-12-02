const passport = require('passport');
const express = require('express');
const {  
    getAllUsers, 
    editUser, 
    deleteUser,
    deleteUnverifiedUser,
} = require('../controllers/userController');
const User = require('../models/User');
const { 
    forgotPassword,
    resetPassword,
    loginUser, 
    registerUser,
    verifyEmail
} = require('../controllers/authController');
const router = express.Router();
const authMiddleware = require('../middleware/authMiddleware'); // Import authMiddleware

// Routes untuk login dan pendaftaran (tidak memerlukan otorisasi)
router.post('/login', loginUser);
router.post('/register', registerUser);
router.post('/verify-email', verifyEmail);
router.post('/forgot-password', forgotPassword);
router.post('/reset-password', resetPassword);

// Routes admin untuk mengelola pengguna (dilindungi oleh authMiddleware)
router.get('/users', authMiddleware, getAllUsers);
router.put('/users/:id', authMiddleware, editUser);
router.delete('/users/:id', authMiddleware, deleteUser);

// Route untuk mendapatkan informasi pengguna berdasarkan token (dilindungi oleh authMiddleware)
router.get('/get-user', authMiddleware, (req, res) => {
    try {
      const { id, name, role } = req.user; // Ambil data user dari token
      res.json({ id, name, role }); // Kirim respons dengan nama user
    } catch (error) {
      console.error('Error fetching user data:', error);
      res.status(500).json({ message: 'Error fetching user data' });
    }
  });

// Route untuk mendapatkan peran pengguna berdasarkan token (dilindungi oleh authMiddleware)
router.get('/get-role', authMiddleware, async (req, res) => {
    try {
      const user = await User.findByPk(req.user.id, { attributes: ['role'] });
      if (!user) {
        return res.status(404).json({ message: 'User not found' });
      }
      res.json({ role: user.role });
    } catch (error) {
      console.error('Error fetching role:', error);
      res.status(500).json({ message: 'Server error' });
    }
  });

// Route untuk memulai proses login dengan Google
router.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

// Route untuk menangani callback dari Google
router.get('/auth/google/callback', 
  passport.authenticate('google', { failureRedirect: 'https://web-development-beta-opal.vercel.app/Login', session: false }), 
  (req, res) => {
    const role = req.user.role || 'editor';  // Asumsi role default adalah 'editor'
    const name = req.user.name;  // Ambil nama pengguna dari req.user

    res.redirect(`/api/auth/success?token=${req.user.token}&role=${role}&name=${name}`);
  }
);

// Route untuk menangani hasil sukses setelah Google login
router.get('/auth/success', (req, res) => {
  const token = req.query.token;
  const role = req.query.role;
  const name = req.query.name;
  
  if (!token) {
    return res.status(400).json({ message: 'Token not provided' });
  }

  // Redirect ke frontend dengan token dan role
  return res.redirect(`https://web-development-beta-opal.vercel.app/google-auth?token=${token}&role=${role}&name=${name}`);
});

// Rute untuk akses tamu tanpa login (tidak memerlukan otorisasi)
router.post('/guest', (req, res) => {
  res.status(200).json({ message: "Guest access granted" });
});

router.post('/delete-unverified', deleteUnverifiedUser);

module.exports = router;
