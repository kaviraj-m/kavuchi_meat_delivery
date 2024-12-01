const express = require('express');
const router = express.Router();
const cartController = require('../controllers/cartController');

router.post('/cart', cartController.addToCart);
router.get('/cart', cartController.getCart);
router.delete('/cart/:id', cartController.removeFromCart);

module.exports = router;
