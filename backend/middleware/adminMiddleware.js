// backend/middleware/adminMiddleware.js
const adminMiddleware = (req, res, next) => {
    // Memastikan bahwa req.user telah didefinisikan oleh authMiddleware
    if (!req.user) {
      return res.status(401).json({ message: 'Pengguna tidak terautentikasi' });
    }
  
    // Periksa apakah pengguna memiliki peran admin
    if (req.user.role !== 'admin') {
      return res.status(403).json({ message: 'Akses ditolak, anda bukan admin' });
    }
  
    next(); // Lanjutkan ke route handler berikutnya jika peran adalah admin
  };
  
  module.exports = adminMiddleware;
  