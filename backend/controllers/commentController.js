// Backend: controllers/commentController.js
const Comment = require('../models/Comment');
const User = require('../models/User');
const Movie = require('../models/Movie');

// Get all comments
exports.getAllComments = async (req, res) => {
  try {
    const comments = await Comment.findAll({
      include: [
        {
          model: User,
          attributes: ['name'], // Ambil kolom 'name' dari User
        },
        {
          model: Movie,
          attributes: ['title'], // Ambil kolom 'title' dari Movie
        },
      ],
    });
    res.status(200).json(comments); // Kirimkan array comments dengan User dan Movie yang sudah di-include
  } catch (err) {
    res.status(500).json({ message: 'Server Error', error: err });
  }
};

exports.updateCommentStatus = async (req, res) => {
    const { id } = req.params;
    const { status } = req.body;
  
    try {
      const comment = await Comment.findByPk(id);
      if (!comment) {
        return res.status(404).json({ message: "Comment not found" });
      }
      comment.status = status;
      await comment.save();
      res.json({ message: "Comment status updated successfully", comment });
    } catch (error) {
      console.error("Error updating comment status:", error);
      res.status(500).json({ message: "Server error" });
    }
  };
  
  // Delete a comment
  exports.deleteComment = async (req, res) => {
    const { id } = req.params;
  
    try {
      const comment = await Comment.findByPk(id);
      if (!comment) {
        return res.status(404).json({ message: "Comment not found" });
      }
      await comment.destroy();
      res.json({ message: "Comment deleted successfully" });
    } catch (error) {
      console.error("Error deleting comment:", error);
      res.status(500).json({ message: "Server error" });
    }
  };

  exports.addComment = async (req, res) => {
    const { comment, movieid, rate } = req.body;
    const userid = req.user.id; // Dapatkan userid dari middleware
  
    if (!comment || !movieid || !userid) {
      return res.status(400).json({ message: "Comment, movieid, and userid are required" });
    }
  
    try {
      const newComment = await Comment.create({
        comment,
        movieid,
        userid,
        rate,
        status: "Unapproved", // Status default
        time: new Date(),
      });
  
      res.status(201).json({ message: "Comment added successfully", comment: newComment });
    } catch (error) {
      console.error("Error adding comment:", error);
      res.status(500).json({ message: "Server error", error });
    }
  };