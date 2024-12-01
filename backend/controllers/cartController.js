const Cart = require('../models/cart');

exports.addToCart = async (req, res) => {
  const { productId, quantity } = req.body;
  try {
    const cartItem = await Cart.create({ productId, quantity });
    res.status(201).json({ cartItem });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

exports.getCart = async (req, res) => {
  try {
    const cartItems = await Cart.findAll();
    res.status(200).json({ cartItems });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

exports.removeFromCart = async (req, res) => {
  const { id } = req.params;
  try {
    const cartItem = await Cart.findByPk(id);
    if (!cartItem) {
      return res.status(404).json({ error: 'Item not found in cart' });
    }
    await cartItem.destroy();
    res.status(200).json({ message: 'Item removed from cart' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
