import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart'; // nhớ sửa đường dẫn nếu app của bạn đổi tên

void main() {
  testWidgets('Dinosaur Game basic tap test', (WidgetTester tester) async {
    // Build our Dinosaur game app and trigger a frame
    await tester.pumpWidget(const DinosaurGame());

    // Verify that the game starts without "Game Over" text
    expect(find.textContaining('Game Over'), findsNothing);

    // Tap to make dinosaur jump
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // After tap, still no "Game Over" immediately
    expect(find.textContaining('Game Over'), findsNothing);

    // Simulate time passing to let dinosaur fall down and possibly hit obstacle
    await tester.pump(const Duration(seconds: 5));

    // Now there is a chance the game is over
    expect(find.textContaining('Game Over'), findsOneWidget);

    // Tap again to restart game
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // After restart, "Game Over" should disappear
    expect(find.textContaining('Game Over'), findsNothing);
  });
}
