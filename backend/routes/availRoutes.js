const express = require('express');
const router = express.Router();
const availController = require('../controllers/availController');

router.get('/avail', availController.getAllavails);
router.post('/addAvail', availController.addAvailability);
router.put('/avail/:id', availController.editAvailability);
router.delete('/avail/:id', availController.deleteAvailability);

module.exports = router;
