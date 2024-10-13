// backend/middleware/authMiddleware.js
const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
  const token = req.header('Authorization')?.split(' ')[1]; // Mendapatkan token dari header 'Authorization'

  if (!token) {
    return res.status(401).json({ message: 'Tidak ada token, otentikasi gagal' });
  }

  try {
    // Verifikasi token dengan secret key
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded; // Set user data pada request object
    next(); // Lanjutkan ke route handler berikutnya
  } catch (err) {
    return res.status(401).json({ message: 'Token tidak valid' });
  }
};

module.exports = authMiddleware;
