const express = require('express');
const {  
    getAllUsers, 
    editUser, 
    deleteUser 
} = require('../controllers/userController');
const { 
    forgotPassword,
    resetPassword,
    loginUser, 
    registerUser,
    verifyEmail
} = require('../controllers/authController');
const router = express.Router();
const jwt = require('jsonwebtoken');
const authMiddleware = require('../middleware/authMiddleware');

router.post('/login', loginUser);
router.post('/register', registerUser);
router.post('/verify-email', verifyEmail);
router.post('/forgot-password', forgotPassword);
router.post('/reset-password', resetPassword);

// Admin routes for managing users
router.get('/users', getAllUsers);
router.post('/users/:id', editUser);
router.post('/users/delete/:id', deleteUser);

router.get('/get-user', authMiddleware, (req, res) => {
    try {
      const { id, name, role } = req.user; // Ambil data user dari token
      res.json({ id, name, role }); // Kirim respons dengan nama user
    } catch (error) {
      console.error('Error fetching user data:', error);
      res.status(500).json({ message: 'Error fetching user data' });
    }
  });

// Route untuk memulai proses login dengan Google
router.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

// Route untuk menangani callback dari Google
router.get('/auth/google/callback', 
  passport.authenticate('google', { failureRedirect: '/login', session: false }), 
  (req, res) => {
    const role = req.user.role || 'editor';  // Asumsi role default adalah 'editor'
    const name = req.user.name || 'mathar';  // Ambil nama pengguna dari req.user

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
  return res.redirect(`http://localhost:3000/google-auth?token=${token}&role=${role}&name=${name}`);
});

module.exports = router;
