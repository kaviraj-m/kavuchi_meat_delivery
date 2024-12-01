const express = require('express');
const router = express.Router();
const orderController = require('../controllers/orderController');

router.post('/order', orderController.createOrder);
router.get('/orders', orderController.getAllOrders);

module.exports = router;
