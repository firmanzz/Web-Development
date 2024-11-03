const express = require('express');
const router = express.Router();
const countryController = require('../controllers/countryController');
const authMiddleware = require('../middleware/authMiddleware');

router.get('/countries', authMiddleware, countryController.getAllCountry);
router.post('/addCountries', authMiddleware, countryController.addCountry);
router.delete('/countries/:id', authMiddleware, countryController.deleteCountry);
router.put('/countries/:id', authMiddleware, countryController.editCountry);

module.exports = router;
