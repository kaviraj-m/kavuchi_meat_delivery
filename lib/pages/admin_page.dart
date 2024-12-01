import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Map<String, String>> productList = [
    {
      'name': 'Chicken Medium Cut - 500g',
      'price': '110',
      'image': 'assets/images/chicken_cut.jpg',
      'pieces': '3-4 pieces',
      'stock': '100',
    },
    {
      'name': 'Sea Bass - 1kg',
      'price': '450',
      'image': 'assets/images/sea_bass.jpg',
      'pieces': '2-3 pieces',
      'stock': '50',
    },
    {
      'name': 'Mutton Combo Pack - 1kg',
      'price': '600',
      'image': 'assets/images/mutton_combo.jpg',
      'pieces': '6-8 pieces',
      'stock': '30',
    },
    {
      'name': 'Chicken Drumsticks - 1kg',
      'price': '220',
      'image': 'assets/images/drumsticks.jpg',
      'pieces': '6-8 pieces',
      'stock': '80',
    },
  ];

  List<Map<String, String>> orderList = [
    {
      'orderId': 'ORD123',
      'customerName': 'John Doe',
      'productNames': 'Chicken Medium Cut, Sea Bass',
      'orderStatus': 'Pending',
      'totalPrice': '560',
      'orderDate': '2024-12-01',
    },
    {
      'orderId': 'ORD124',
      'customerName': 'Jane Smith',
      'productNames': 'Mutton Combo Pack',
      'orderStatus': 'Completed',
      'totalPrice': '600',
      'orderDate': '2024-12-02',
    },
    {
      'orderId': 'ORD125',
      'customerName': 'Alan Brown',
      'productNames': 'Chicken Drumsticks, Sea Bass',
      'orderStatus': 'Canceled',
      'totalPrice': '670',
      'orderDate': '2024-12-03',
    },
  ];

  // Controller to add a new product
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productStockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.red, // Changed to Red
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              'Manage Products',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 25),

            // Buttons Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton('Add New Product', Colors.green, () {
                  _showAddProductDialog();
                }),
                _buildActionButton('Update Stock', Colors.orange, () {
                  // Update stock functionality (can be implemented here)
                }),
              ],
            ),
            SizedBox(height: 25),

            // Product List Section
            Text(
              'Product List',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 15),

            // List of products with details
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  var product = productList[index];
                  return _buildProductCard(product, index);
                },
              ),
            ),
            SizedBox(height: 25),

            // Order Details Section
            Text(
              'Order Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 15),

            // List of orders
            Expanded(
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  var order = orderList[index];
                  return _buildOrderCard(order);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create action buttons
  Widget _buildActionButton(String title, Color color, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(100, 50),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  // Helper function to build product cards
  Widget _buildProductCard(Map<String, String> product, int index) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                product['image']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),

            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${product['pieces']} - \$${product['price']}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Stock: ${product['stock']}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            // Action Buttons (Edit, Delete)
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // Implement edit functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Implement delete functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build order cards
  Widget _buildOrderCard(Map<String, String> order) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // Order Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ID: ${order['orderId']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Customer: ${order['customerName']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Products: ${order['productNames']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Total: \$${order['totalPrice']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Date: ${order['orderDate']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Order Status
                  Text(
                    'Status: ${order['orderStatus']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _getOrderStatusColor(order['orderStatus']!),
                    ),
                  ),
                ],
              ),
            ),
            // Action Buttons (Complete, Cancel)
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.check_circle, color: Colors.green),
                  onPressed: () {
                    // Implement complete order functionality
                  },
                ),
                IconButton(
                  icon: Icon(Icons.cancel, color: Colors.red),
                  onPressed: () {
                    // Implement cancel order functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to get the color of the order status
  Color _getOrderStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Canceled':
        return Colors.red;
      case 'Pending':
      default:
        return Colors.orange;
    }
  }

  // Show Add Product Dialog
  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add New Product"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Product Price'),
              ),
              TextField(
                controller: productStockController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Product Stock'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  productList.add({
                    'name': productNameController.text,
                    'price': productPriceController.text,
                    'image': 'assets/images/placeholder.jpg',
                    'pieces': '1-2 pieces',
                    'stock': productStockController.text,
                  });
                });
                Navigator.pop(context);
              },
              child: Text('Add Product'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
