const adminMiddleware = (req, res, next) => {
  if (!req.user) {
    return res.status(403).json({ message: 'Access denied. No user authenticated.' });
  }

  // Allow admin full access
  if (req.user.role === 'admin') {
    return next();
  }

  // Allow editor to access only the addMovie route
  if (req.user.role === 'editor' && req.path === '/addMovie') {
    return next();
  }

  // If not admin or editor trying to access a forbidden route
  return res.status(403).json({ message: 'Access denied' });
};

module.exports = adminMiddleware;
