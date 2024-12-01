import 'package:flutter/material.dart';
import '../models/product.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> cartProducts = [
    Product(
      name: 'Chicken Medium Cut - 500g',
      price: 110,
      image: 'assets/images/chicken_cut.jpg',
      pieces: '3-4 pieces',
    ),
    Product(
      name: 'Sea Bass - 1kg',
      price: 450,
      image: 'assets/images/sea_bass.jpg',
      pieces: '2-3 pieces',
    ),
    Product(
      name: 'Mutton Combo Pack - 1kg',
      price: 600,
      image: 'assets/images/mutton_combo.jpg',
      pieces: '6-8 pieces',
    ),
    Product(
      name: 'Chicken Drumsticks - 1kg',
      price: 220,
      image: 'assets/images/drumsticks.jpg',
      pieces: '6-8 pieces',
    ),
    Product(
      name: 'Freshwater Rohu - 1kg',
      price: 200,
      image: 'assets/images/rohu.jpg',
      pieces: '4-5 pieces',
    ),
  ];

  double getTotalPrice() {
    return cartProducts.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.red,
      ),
      body: cartProducts.isEmpty
          ? Center(child: Text("Your cart is empty!"))
          : ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.image,
                        width: 80, // Reduced image size
                        height: 80, // Reduced image size
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16, // Reduced font size
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "${product.pieces} - \$${product.price}",
                      style: TextStyle(
                        fontSize: 14, // Reduced font size
                        color: Colors.grey.shade700,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          cartProducts.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cartProducts.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout process here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 12), // Reduced padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  "Checkout - \$${getTotalPrice()}",
                  style: TextStyle(
                    fontSize: 18, // Reduced button text size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
    );
  }
}
