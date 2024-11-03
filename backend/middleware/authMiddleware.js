const jwt = require('jsonwebtoken');
const User = require('../models/User');

const authMiddleware = async (req, res, next) => {
  const token = req.header('Authorization')?.split(' ')[1];
  
  // Jika tidak ada token, tolak akses dengan status 401
  if (!token) {
    return res.status(401).json({ message: 'Access denied. No token provided.' });
  }

  try {
    // Verifikasi token JWT
    const verified = jwt.verify(token, process.env.JWT_SECRET);
    req.user = verified;

    // Cari user berdasarkan ID di token
    const user = await User.findOne({ where: { id: verified.id } });
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Tambahkan nama dan peran user ke req.user untuk akses berikutnya
    req.user.name = user.name;
    req.user.role = user.role;
    next(); // Lanjutkan ke handler berikutnya jika token valid
  } catch (err) {
    // Jika token tidak valid, balas dengan status 400
    res.status(400).json({ message: 'Invalid token.' });
  }
};

module.exports = authMiddleware;
