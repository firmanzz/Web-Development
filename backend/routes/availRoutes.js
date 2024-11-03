const express = require('express');
const router = express.Router();
const availController = require('../controllers/availController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/avail', authMiddleware, availController.getAllavails);
router.post('/addAvail', authMiddleware, availController.addAvailability);
router.put('/avail/:id', authMiddleware, availController.editAvailability);
router.delete('/avail/:id', authMiddleware, availController.deleteAvailability);

module.exports = router;
