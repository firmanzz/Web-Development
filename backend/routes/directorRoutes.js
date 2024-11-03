const express = require('express');
const router = express.Router();
const directorController = require('../controllers/directorController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/directors', authMiddleware, directorController.getAllDirector);
router.post('/addDirector', authMiddleware, directorController.addDirector);
router.delete('/directors/:id', authMiddleware, directorController.deleteDirector);
router.put('/directors/:id', authMiddleware, directorController.editDirector);

module.exports = router;
