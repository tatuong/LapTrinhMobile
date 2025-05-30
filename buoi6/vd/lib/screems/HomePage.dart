import 'package:flutter/material.dart';
import 'package:vd/screems/Home/NotificationCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const [NotificationCard(), SizedBox(height: 16)],
      ),
    );
  }
}
