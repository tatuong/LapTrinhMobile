import 'package:flutter/material.dart';
import 'package:vd/screems/Home/WorkCard.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(children: const [WorkCard(), SizedBox(height: 16)]),
    );
  }
}
