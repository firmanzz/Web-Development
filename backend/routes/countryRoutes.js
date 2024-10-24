const express = require('express');
const router = express.Router();
const countryController = require('../controllers/countryController');

router.get('/countries', countryController.getAllCountry);
router.post('/addCountries', countryController.addCountry);
router.delete('/countries/:id', countryController.deleteCountry);
router.put('/countries/:id', countryController.editCountry);

module.exports = router;
