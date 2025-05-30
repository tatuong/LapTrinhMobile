import 'package:flutter/material.dart';

import 'screems/HomePage.dart';
import 'screems/WorkPage.dart';
import 'screems/StudyPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePageApp(),
    );
  }
}

class HomePageApp extends StatefulWidget {
  const HomePageApp({super.key});

  @override
  State<HomePageApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageApp> {
  int _currentTindex = 0;
  final List<Widget> _pages = [HomePage(), WorkPage(), StudyPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page App')),
      body: _pages[_currentTindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTindex,
        onTap: (index) {
          print('Select index: $index');
          setState(() {
            _currentTindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Work'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Study'),
        ],
      ),
    );
  }
}
