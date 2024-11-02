const express = require('express');
const router = express.Router();
const commentController = require('../controllers/commentController');
const authMiddleware = require('../middleware/authMiddleware');

// Route to get all comments
router.get('/comments', commentController.getAllComments);
router.put('/comments/:id', commentController.updateCommentStatus);
router.delete('/comments/:id', commentController.deleteComment);
router.post('/comments', authMiddleware, commentController.addComment);

module.exports = router;
