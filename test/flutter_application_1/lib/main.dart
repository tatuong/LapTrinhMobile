import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const DinosaurGame());
}

class DinosaurGame extends StatelessWidget {
  const DinosaurGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinosaur Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double dinosaurY = 1; // Vị trí Y của khủng long
  bool isJumping = false;
  double obstacleX = 1.2; // Vị trí X của vật cản (lệch ra ngoài màn hình 1 tí)
  Timer? gameTimer;
  bool isGameOver = false;
  int score = 0;

  static const double gravity = 4.9;
  static const double jumpVelocity = -3.5;
  double velocity = 0;
  double time = 0;
  double initialPos = 1;

  void startGame() {
    gameTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      time += 0.03;

      setState(() {
        obstacleX -= 0.02;

        double height = gravity * time * time + velocity * time;

        if (initialPos + height > 1) {
          dinosaurY = 1;
        } else {
          dinosaurY = initialPos + height;
        }
      });

      // Khi vật cản ra khỏi màn hình => reset + tăng điểm
      if (obstacleX < -1.2) {
        obstacleX = 1.2;
        score++;
      }

      // Kiểm tra va chạm
      if (detectCollision()) {
        timer.cancel();
        isGameOver = true;
      }
    });
  }

  void jump() {
    if (dinosaurY == 1) {
      time = 0;
      initialPos = dinosaurY;
      velocity = jumpVelocity;
    }
  }

  bool detectCollision() {
    // Xác định khoảng cách thực sự giữa dino và vật cản
    // Dino đứng lệch bên trái (-0.8), vật cản ban đầu bên phải (1.2)

    // Tính khoảng cách giữa dino và obstacle
    double dinoX = -0.8; // fixed vị trí khủng long
    double obstacleCenterX = obstacleX;

    // Nếu khoảng cách X nhỏ (tức gần nhau) và dino đang thấp (không nhảy)
    if ((obstacleCenterX - dinoX).abs() < 0.1 && dinosaurY > 0.85) {
      return true;
    }
    return false;
  }

  void resetGame() {
    setState(() {
      dinosaurY = 1;
      obstacleX = 1.2;
      isGameOver = false;
      score = 0;
      time = 0;
      initialPos = 1;
      velocity = 0;
    });
    startGame();
  }

  @override
  void initState() {
    super.initState();
    startGame();
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isGameOver) {
          resetGame();
        } else {
          jump();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: Colors.white),
            // Khủng long
            AnimatedContainer(
              alignment: Alignment(-0.8, dinosaurY),
              duration: const Duration(milliseconds: 0),
              child: const Icon(Icons.android, size: 60, color: Colors.green),
            ),
            // Vật cản - cây
            AnimatedContainer(
              alignment: Alignment(obstacleX, 1),
              duration: const Duration(milliseconds: 0),
              child: const Icon(Icons.park, size: 60, color: Colors.teal),
            ),
            // Điểm số
            Positioned(
              top: 40,
              right: 20,
              child: Text(
                'Score: $score',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Game Over
            if (isGameOver)
              Center(
                child: Text(
                  'Game Over\nTap to Restart',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
