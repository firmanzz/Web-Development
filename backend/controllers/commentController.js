const Comment = require('../models/Comment');

// Get all comments
exports.getAllComments = async (req, res) => {
    try {
        const comments = await Comment.find();
        res.render('comments', { comments });
    } catch (err) {
        res.status(500).send('Server Error');
    }
};

// Approve comments
exports.approveComments = async (req, res) => {
    try {
        const { commentIds } = req.body;
        await Comment.updateMany(
            { _id: { $in: commentIds } },
            { $set: { status: 'Approved' } }
        );
        res.redirect('/comments');
    } catch (err) {
        res.status(500).send('Server Error');
    }
};

// Delete comments
exports.deleteComments = async (req, res) => {
    try {
        const { commentIds } = req.body;
        await Comment.deleteMany({ _id: { $in: commentIds } });
        res.redirect('/comments');
    } catch (err) {
        res.status(500).send('Server Error');
    }
};
