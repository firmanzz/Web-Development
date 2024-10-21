const User = require('../models/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

// Register a new user
exports.registerUser = async (req, res) => {
    const { name, email, password } = req.body;
  
    try {
      let user = await User.findOne({ where: { email } });
      if (user) {
        return res.status(400).json({ msg: 'User already exists' });
      }
  
      user = new User({
        name,
        email,
        password,
        role: "editor",
      });
  
      const salt = await bcrypt.genSalt(10);
      user.password = await bcrypt.hash(password, salt);
  
      await user.save();
  
      res.status(201).json({ msg: 'User registered successfully' });
    } catch (err) {
      console.error(err.message);
      res.status(500).send('Server Error');
    }
};

// Log in a user
exports.loginUser = async (req, res) => {
    const { name, password } = req.body;
  
    try {
      const user = await User.findOne({ where: { name } });
  
      if (!user) {
        return res.status(400).json({ message: 'User not found' });
      }
  
      const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        return res.status(400).json({ message: 'Invalid credentials' });
      }
  
      // Generate JWT token
    const token = jwt.sign(
      { id: user.id, name: user.name, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );
  
      // Send token and user data in response
      res.json({ 
        token, 
        data: { id: user.id, name: user.name, role: user.role } 
      });
    } catch (error) {
      console.error('Login Error:', error);
      res.status(500).json({ message: 'Server error' });
    }
  };

// Get all users
exports.getAllUsers = async (req, res) => {
  try {
    const users = await User.findAll({logging: false,});
    res.status(200).json(users);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'An error occurred' });
  }
};

// Edit a user
exports.editUser = async (req, res) => {
  const { id } = req.params; 
  const { suspend } = req.body; 

  try {
    // Cari user berdasarkan ID
    const user = await User.findByPk(id);

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Update status suspend
    user.suspend = suspend;

    // Simpan perubahan
    await user.save();

    // Kirim respons dengan data user yang telah diperbarui
    res.status(200).json({ message: "User suspend status updated successfully", user });
  } catch (error) {
    console.error("Error updating user suspend status:", error);
    res.status(500).json({ message: "An error occurred while updating user suspend status" });
  }
};

// Delete a user
exports.deleteUser = async (req, res) => {
    try {
        const { id } = req.params;
        await User.findByIdAndDelete(id);
        res.redirect('/users');
    } catch (err) {
        res.status(500).send('Server Error');
    }
};
