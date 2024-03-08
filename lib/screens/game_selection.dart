import 'package:flutter/material.dart';
import 'package:poker_hand_guru/screens/cheat_sheet.dart';
import 'package:poker_hand_guru/screens/hand_rank_test.dart';
import 'package:poker_hand_guru/screens/hand_test.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green[300]!, // Top color of the gradient
              Colors.green[600]!, // Middle color of the gradient
              Colors.green[900]!, // Bottom color of the gradient
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "POKER HAND GURU",
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontFamily: 'Atma',
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 200,
                child: Image.asset("assets/images/cards.png"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheatSheetScreen()));
                },
                child: const Text(
                  "Open Cheat Sheet",
                  style: TextStyle(
                    // fontFamily: 'Atma',
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HandTestScreen()));
                },
                child: const Text(
                  "Test your Poker Hand Knowledge",
                  style: TextStyle(
                    // fontFamily: 'Atma',
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HandRankTestScreen()));
                },
                child: const Text(
                  "Test your Poker Hand Ranking Knowledge",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontFamily: 'Atma',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
