const express = require('express');
const router = express.Router();
const credsController = require('../controllers/credsController');

// Define routes for the creds table
router.post('/', credsController.createCreds);
router.get('/', credsController.getAllCreds);
router.get('/:id', credsController.getCredsById);
router.put('/:id', credsController.updateCreds);
router.delete('/:id', credsController.deleteCreds);

module.exports = router;