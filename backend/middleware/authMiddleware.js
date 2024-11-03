const jwt = require('jsonwebtoken');
const User = require('../models/User');
require('dotenv').config(); // Access environment variables

const authMiddleware = async (req, res, next) => {
  const token = req.header('Authorization')?.split(' ')[1];

  // Allow guest access with dummy token
  if (token === process.env.DUMMY_TOKEN) {
    req.user = { role: 'guest' }; 
    return next();
  }

  if (!token) {
    return res.status(401).json({ message: 'Access denied. No token provided.' });
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
    res.status(400).json({ message: 'Invalid token.' });
  }
};

module.exports = authMiddleware;
