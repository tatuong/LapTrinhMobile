import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyHome()));

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _index = 1;

  final pages = [
    Center(child: Text("🏠 Home Page")),
    Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.work, size: 20), Text(" Work Page")],
      ),
    ),
    Center(child: Text("🎓 Study Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(["Home", "Work", "Study"][_index])),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Work"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Study"),
        ],
      ),
    );
  }
}
