const express = require('express');
const { loginUser, registerUser, getAllUsers, editUser, deleteUser } = require('../controllers/userController');
const router = express.Router();

router.post('/login', loginUser);
router.post('/register', registerUser);

// Admin routes for managing users
router.get('/users', getAllUsers);
router.post('/users/edit/:id', editUser);
router.post('/users/delete/:id', deleteUser);

module.exports = router;
