import 'package:flutter/material.dart';

class StudyCard extends StatelessWidget {
  const StudyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          color: Colors.green[50],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' Nội dung học tập',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '- Ôn lại kiến thức Flutter cơ bản',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Làm bài tập về Widget & Layout',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Hoàn thành project nhỏ',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Tiến độ:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.6,
                        color: Colors.green,
                        backgroundColor: Colors.green[200],
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text('60%'),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Đang chuyển đến chi tiết học tập..."),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Xem chi tiết'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: Colors.lightGreen[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      ' Lịch học',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Thứ 2:Học java - 07:45',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Thứ 4:Học Python - 07:45',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Thứ 6:Học Dart - 07:45',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
