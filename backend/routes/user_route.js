const router = require('express').Router();
const userController = require('../controllers/user.controller');


// Define your routes here
router.post('/registration', userController.register);
router.post('/login', userController.login);

module.exports = router; // Corrected export
