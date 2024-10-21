const Comment = require('../models/Comment');

// Get all comments
exports.getAllComments = async (req, res) => {
    try {
        const comments = await Comment.findAll();  // Menggunakan Sequelize's findAll
        res.status(200).json({ comments });  // Mengirim JSON response
    } catch (err) {
        res.status(500).json({ message: 'Server Error', error: err });
    }
};
