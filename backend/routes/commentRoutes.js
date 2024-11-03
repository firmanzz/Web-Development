const express = require('express');
const router = express.Router();
const commentController = require('../controllers/commentController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/comments', authMiddleware, commentController.getAllComments);
router.put('/comments/:id', authMiddleware, commentController.updateCommentStatus);
router.delete('/comments/:id', authMiddleware, commentController.deleteComment);
router.post('/comments', authMiddleware, commentController.addComment);

module.exports = router;
