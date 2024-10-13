// backend/controllers/authController.js
const jwt = require('jsonwebtoken');

const loginController = (req, res) => {
  const { username, password } = req.body;

  // Verifikasi username dan password (misalnya menggunakan database)
  // Misalnya berhasil, maka dapatkan role pengguna dari database (contohnya: 'admin' atau 'user')
  const userRole = 'admin'; // Misalnya role yang didapat adalah admin

  const payload = {
    id: user.id, // ID pengguna
    username: user.username,
    role: userRole, // Tambahkan role pengguna ke dalam payload
  };

  // Membuat token JWT
  const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' });

  res.json({ token });
};

module.exports = { loginController };
