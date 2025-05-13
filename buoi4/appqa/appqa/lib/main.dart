import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // ✅ Constructor thêm key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Home Page',
      home: const ProductPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key); // ✅ Constructor thêm key

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Saleor Polo Shirt',
      'price': '\$4.50',
      'image': 'assets/image/shirt.jpg',
    },
    {
      'name': 'Saleor T-Shirt',
      'price': '\$4.50',
      'image': 'assets/image/tshirt.jpg',
    },
    {
      'name': 'Saleor Beanie',
      'price': '\$4.50',
      'image': 'assets/image/mu.jpg',
    },
    {'name': 'Saleor Cup', 'price': '\$4.50', 'image': 'assets/image/coc.jpg'},
    {
      'name': 'Saleor Card',
      'price': '\$4.50',
      'image': 'assets/image/card.jpg',
    },
    {
      'name': 'Saleor Hoodie',
      'price': '\$4.50',
      'image': 'assets/image/hoodie.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children:
                  products.map((product) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(product['image'], height: 80),
                          const SizedBox(height: 10),
                          Text(
                            product['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product['price'],
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
