import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const BallGame());
}

class BallGame extends StatelessWidget {
  const BallGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Game variables
  int score = 0;
  double ballX = 0.0;
  double ballY = 0.0;
  bool isGameActive = true;
  late Timer gameTimer;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  // Function to start the game
  void startGame() {
    setState(() {
      score = 0;
      isGameActive = true;
    });

    // Game duration is 30 seconds
    gameTimer = Timer(const Duration(seconds: 30), () {
      setState(() {
        isGameActive = false;
      });
    });
  }

  // Function to move the ball to a random position
  void moveBall() {
    if (isGameActive) {
      final random = Random();
      setState(() {
        ballX = random.nextDouble() * 2 - 1; // random X position (-1 to 1)
        ballY = random.nextDouble() * 2 - 1; // random Y position (-1 to 1)
        score += 1;
      });
    }
  }

  @override
  void dispose() {
    gameTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap the Ball Game'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Stack(
        children: [
          Center(
            child: isGameActive
                ? Stack(
                    children: [
                      // Game Score
                      Positioned(
                        top: 50,
                        left: 20,
                        child: Text(
                          'Score: $score',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Ball Widget
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        left: MediaQuery.of(context).size.width / 2 +
                            ballX * (MediaQuery.of(context).size.width / 2 - 50),
                        top: MediaQuery.of(context).size.height / 2 +
                            ballY *
                                (MediaQuery.of(context).size.height / 2 - 50),
                        child: GestureDetector(
                          onTap: moveBall,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Game Over\nYour Score: $score',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            startGame();
                          },
                          child: const Text('Restart Game'),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
