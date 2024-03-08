import 'package:flutter/material.dart';
import 'package:poker_hand_guru/screens/game_selection.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Image.asset("assets/images/cards.png"),
                  ),
                  const Positioned(
                    top: 0,
                    child: Text(
                      "POKER HAND GURU",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontFamily: 'Atma',
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameSelectionScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Go",
                    style: TextStyle(
                      // fontFamily: 'Atma',
                      fontSize: 32.0,
                    ),
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
