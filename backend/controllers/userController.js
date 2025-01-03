const User = require('../models/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

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

exports.deleteUser = async (req, res) => {
  const { id } = req.params;
  try {
    const user = await User.findByPk(id);
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    await user.destroy();
    res.status(200).json({ message: "User deleted successfully" });
  } catch (error) {
    console.error("Error deleting user:", error);
    res.status(500).json({ message: "An error occurred while deleting user" });
  }
};

exports.deleteUnverifiedUser = async (req, res) => {
  const { email } = req.body; // Ambil email dari request body
  try {
      // Cari pengguna dengan email dan pastikan tidak memiliki googleId
      const user = await User.findOne({ where: { email, isVerified: false } });

      if (!user) {
          return res.status(404).json({ message: 'User not found or already verified' });
      }

      // Jika pengguna memiliki googleId, tidak perlu verifikasi
      if (user.googleId) {
          return res.status(400).json({ message: 'Google user does not require verification' });
      }

      // Hapus pengguna
      await user.destroy();
      return res.status(200).json({ message: 'Unverified account deleted successfully' });
  } catch (error) {
      console.error('Error deleting unverified user:', error);
      return res.status(500).json({ message: 'Internal server error' });
  }
};
