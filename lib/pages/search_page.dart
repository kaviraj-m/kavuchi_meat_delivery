import 'package:flutter/material.dart';
import 'dart:async';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = "";
  Timer? _debounce;

  final List<Map<String, String>> items = [
    {
      'name': 'Chicken Medium Cut - 500g',
      'description': 'Fresh and tender chicken cut pieces',
      'image': 'assets/images/chicken_cut.jpg',
    },
    {
      'name': 'Chicken Drumsticks - 1kg',
      'description': 'Juicy chicken drumsticks',
      'image': 'assets/images/drumsticks.jpg',
    },
    {
      'name': 'Sea Bass - 1kg',
      'description': 'Premium sea bass fish',
      'image': 'assets/images/sea_bass.jpg',
    },
    {
      'name': 'Freshwater Rohu - 1kg',
      'description': 'Freshwater fish rich in flavor',
      'image': 'assets/images/rohu.jpg',
    },
    {
      'name': 'Chicken Combo Pack - 1kg',
      'description': 'Perfect chicken combo for your meals',
      'image': 'assets/images/chicken_combo.jpg',
    },
    {
      'name': 'Fish Combo Pack - 1kg',
      'description': 'Delicious fish combo pack',
      'image': 'assets/images/fish_combo.jpg',
    },
    {
      'name': 'Mutton Combo Pack - 1kg',
      'description': 'Rich and flavorful mutton combo',
      'image': 'assets/images/mutton_combo.jpg',
    },
  ];

  List<Map<String, String>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items; // Initially show all items
  }

  void updateSearch(String input) {
    if (_debounce != null) {
      _debounce!.cancel();
    }
    _debounce = Timer(Duration(milliseconds: 500), () {
      setState(() {
        query = input.trim(); // Remove any extra spaces from input
        filteredItems = items
            .where((item) =>
                item['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red),
        titleTextStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade100, // Background color
        child: Column(
          children: [
            // Enhanced Search Box
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: updateSearch,
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: Icon(Icons.search, color: Colors.red),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Results Section
            Expanded(
              child: query.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search,
                              size: 100, color: Colors.grey.shade400),
                          SizedBox(height: 10),
                          Text(
                            'Start typing to search for products.',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : filteredItems.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error_outline,
                                  size: 100, color: Colors.red),
                              SizedBox(height: 10),
                              Text(
                                'No products found for "$query".',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 6.0),
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.all(15), // Increased padding
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      item['image']!,
                                      width: 120, // Increased image size
                                      height: 120, // Increased image size
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      text: '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                      children:
                                          _highlightQuery(item['name']!, query),
                                    ),
                                  ),
                                  subtitle: Text(
                                    item['description']!,
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.add, color: Colors.red),
                                    onPressed: () {
                                      print('Added to cart: ${item['name']}');
                                    },
                                  ),
                                  onTap: () {
                                    print('Selected: ${item['name']}');
                                  },
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _highlightQuery(String text, String query) {
    if (query.isEmpty) return [TextSpan(text: text)];

    final regex = RegExp('($query)', caseSensitive: false);
    final matches = regex.allMatches(text);
    final spans = <TextSpan>[];

    int lastIndex = 0;
    for (final match in matches) {
      spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
      spans.add(TextSpan(
        text: match.group(0),
        style: TextStyle(color: Colors.red),
      ));
      lastIndex = match.end;
    }
    if (lastIndex < text.length) {
      spans.add(TextSpan(text: text.substring(lastIndex)));
    }
    return spans;
  }
}
