import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Vi du')),
        body: Stack(
          children: [
            Container(color: Colors.red),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.star, size: 200, color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
