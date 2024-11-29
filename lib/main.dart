import 'package:flutter/material.dart';
import 'models/category.dart';
import 'models/product.dart';
import 'widgets/category_card.dart';
import 'widgets/product_card.dart';
import 'widgets/section_header.dart';
import 'widgets/search_box.dart';
import 'splash_screen.dart';

void main() {
  runApp(KavuchiApp());
}

class KavuchiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Category> categories = [
    Category(name: 'Sea Fish', image: 'assets/images/sea_fish.jpg'),
    Category(name: 'Freshwater Fish', image: 'assets/images/freshwater_fish.jpg'),
    Category(name: 'Mutton', image: 'assets/images/mutton.jpg'),
    Category(name: 'Chicken', image: 'assets/images/chicken.jpg'),
  ];

  final List<Product> bestsellers = [
    Product(
        name: 'Chicken Medium Cut - 500g',
        price: 110,
        image: 'assets/images/chicken_cut.jpg',
        pieces: '3-4 pieces'),
    Product(
        name: 'Chicken Drumsticks - 1kg',
        price: 220,
        image: 'assets/images/drumsticks.jpg',
        pieces: '6-8 pieces'),
    Product(
        name: 'Sea Bass - 1kg',
        price: 450,
        image: 'assets/images/sea_bass.jpg',
        pieces: '2-3 pieces'),
    Product(
        name: 'Freshwater Rohu - 1kg',
        price: 200,
        image: 'assets/images/rohu.jpg',
        pieces: '4-5 pieces'),
  ];

  final List<Product> combopacks = [
    Product(
        name: 'Chicken Combo Pack - 1kg',
        price: 250,
        image: 'assets/images/chicken_combo.jpg',
        pieces: '10-12 pieces'),
    Product(
        name: 'Fish Combo Pack - 1kg',
        price: 450,
        image: 'assets/images/fish_combo.jpg',
        pieces: '4-5 pieces'),
    Product(
        name: 'Mutton Combo Pack - 1kg',
        price: 600,
        image: 'assets/images/mutton_combo.jpg',
        pieces: '6-8 pieces'),
  ];

  @override
  Widget build(BuildContext context) {
    Color appBarBackground = Colors.grey.shade100;
    Color iconColor = Colors.red; // Color for icons in AppBar and BottomNavigationBar

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackground,
        elevation: 0,
        title: Text(
          'Kavuchi',
          style: TextStyle(
            color: iconColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, size: 25, color: iconColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: appBarBackground,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            // Header Text with specific words in red
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Default text color
                ),
                children: [
                  TextSpan(text: "Let's "),
                  TextSpan(
                    text: "order", 
                    style: TextStyle(color: Colors.red), // 'order' in red
                  ),
                  TextSpan(text: " some fresh\n"),
                  TextSpan(
                    text: "cuts", 
                    style: TextStyle(color: Colors.red), // 'cuts' in red
                  ),
                  TextSpan(text: " for you"),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Search Box
            SearchBox(),
            SizedBox(height: 10),
            // Categories Section
            SectionHeader(
              title: 'Categories',
              onSeeAll: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ListPage(title: 'Categories')));
              },
            ),
            SizedBox(height: 10),
            Container(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: categories[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ListPage(title: categories[index].name),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Bestsellers Section
            SectionHeader(
              title: 'Bestsellers',
              onSeeAll: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ListPage(title: 'Bestsellers')));
              },
            ),
            SizedBox(height: 10),
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: bestsellers.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: bestsellers[index]);
                },
              ),
            ),
            SizedBox(height: 20),
            // Combo Packs Section
            SectionHeader(
              title: 'Combo Packs',
              onSeeAll: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ListPage(title: 'Combo Packs')));
              },
            ),
            SizedBox(height: 10),
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: combopacks.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: combopacks[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.red,  // Set the selected item color to red
        unselectedItemColor: Colors.grey.shade400,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  final String title;

  ListPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('List of $title')),
    );
  }
}
