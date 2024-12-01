const Order = require('../models/order');
const Cart = require('../models/cart');
const Product = require('../models/product');

exports.createOrder = async (req, res) => {
  const { userId } = req.body;
  try {
    // Get all items from the cart
    const cartItems = await Cart.findAll({ where: { userId } });

    // Calculate total price
    let totalPrice = 0;
    for (let item of cartItems) {
      const product = await Product.findByPk(item.productId);
      totalPrice += product.price * item.quantity;
    }

    const order = await Order.create({ userId, totalPrice });
    res.status(201).json({ order });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

exports.getAllOrders = async (req, res) => {
  try {
    const orders = await Order.findAll();
    res.status(200).json({ orders });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
