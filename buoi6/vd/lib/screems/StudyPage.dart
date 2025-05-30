import 'package:flutter/material.dart';
import 'package:vd/screems/Home/StudyCard.dart';

class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(children: const [StudyCard(), SizedBox(height: 16)]),
    );
  }
}
