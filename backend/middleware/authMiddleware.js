const jwt = require('jsonwebtoken');
const User = require('../models/User');

const authMiddleware = async (req, res, next) => {
  const token = req.header('Authorization')?.split(' ')[1];  // Ambil token dari header Authorization
  if (!token) return res.status(401).json({ message: 'Access Denied' });

  try {
    const verified = jwt.verify(token, process.env.JWT_SECRET);  // Verifikasi token
    req.user = verified;  // Simpan data user ke request

    const user = await User.findOne({ where: { id: verified.id } });  // Ambil data user dari database

    if (!user) return res.status(404).json({ message: 'User not found' });

    req.user.name = user.name;  // Simpan nama user ke request
    req.user.role = user.role;  // Simpan role user ke request
    next();
  } catch (err) {
    res.status(400).json({ message: 'Invalid Token' });
  }
};

module.exports = authMiddleware;