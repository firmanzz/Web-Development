const jwt = require('jsonwebtoken');
const User = require('../models/User');

const authMiddleware = async (req, res, next) => {
  const token = req.header('Authorization')?.split(' ')[1];
  if (!token) {
    req.user = null; // Treat as guest if no token
    return next();
  }

  try {
    const verified = jwt.verify(token, process.env.JWT_SECRET);
    req.user = verified;

    const user = await User.findOne({ where: { id: verified.id } });
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    req.user.name = user.name;
    req.user.role = user.role;
    next();
  } catch (err) {
    res.status(400).json({ message: 'Invalid Token' });
  }
};

module.exports = authMiddleware;
