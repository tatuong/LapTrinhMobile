import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  const WorkCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách công việc
    final List<String> tasks = [
      'Hoàn thành báo cáo tháng',
      'Họp nhóm dự án lúc 3 giờ chiều',
      'Gửi email cho thầy',
    ];

    final double progress = 3 / tasks.length;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.orange[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              ' Công việc hôm nay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...tasks
                .map(
                  (task) => Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: Colors.brown,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(task, style: const TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                )
                .toList(),

            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Tiến độ:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.orange[200],
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(width: 12),
                Text('${(progress * 100).round()}%'),
              ],
            ),

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Xem chi tiết công việc...')),
                  );
                },
                icon: const Icon(Icons.work_outline),
                label: const Text('Xem chi tiết'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
