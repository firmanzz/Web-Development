const express = require('express');
const { loginUser, registerUser, getAllUsers, editUser, deleteUser } = require('../controllers/userController');
const router = express.Router();
const jwt = require('jsonwebtoken');
const authMiddleware = require('../middleware/authMiddleware');

router.post('/login', loginUser);
router.post('/register', registerUser);

// Admin routes for managing users
router.get('/users', getAllUsers);
router.post('/users/edit/:id', editUser);
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
  
module.exports = router;
