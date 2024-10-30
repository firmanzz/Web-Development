const adminMiddleware = (req, res, next) => {
  if (!req.user) {
    return res.status(403).json({ message: 'Access denied. No user authenticated.' });
  }

  // Allow admin full access
  if (req.user.role === 'admin') {
    return next();
  }

  // Allow all authenticated users except admin to access /addMovie
  if (req.path === '/addMovie') {
    return next();
  }

  // If not allowed
  return res.status(403).json({ message: 'Access denied' });
};

module.exports = adminMiddleware;
