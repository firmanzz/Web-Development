const express = require('express');
const router = express.Router();
const commentController = require('../controllers/commentController');

// Route to get all comments
router.get('/comments', commentController.getAllComments);

// Route to approve comments
router.post('/comments/approve', commentController.approveComments);

// Route to delete comments
router.post('/comments/delete', commentController.deleteComments);

module.exports = router;
