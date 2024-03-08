import 'package:flutter/material.dart';

class CheatSheetScreen extends StatelessWidget {
  const CheatSheetScreen({Key? key}) : super(key: key);

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
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                      width: 100,
                      child: Image.asset("assets/images/cards.png"),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '''Poker Hand Cheat Sheet
        
        1. Royal Flush:
          A, K, Q, J, 10 of the same suit.
          Highest possible hand. Extremely rare.
        
        2. Straight Flush:
          Five consecutive cards of the same suit.
          Example: 8♠ 7♠ 6♠ 5♠ 4♠
        
        3. Four of a Kind:
          Four cards of the same rank.
          Example: 9♦ 9♠ 9♣ 9♥ J♥
        
        4. Full House:
          Three cards of one rank and two of another.
          Example: A♠ A♦ A♣ 6♥ 6♠
        
        5. Flush:
          Five cards of the same suit, not in sequence.
          Example: K♣ 10♣ 7♣ 4♣ 3♣
        
        6. Straight:
          Five consecutive cards of any suit.
          Example: 10♦ 9♠ 8♥ 7♠ 6♦
        
        7. Three of a Kind:
          Three cards of the same rank.
          Example: 7♣ 7♠ 7♦ J♠ 5♣
        
        8. Two Pair:
          Two cards of one rank, two of another.
          Example: Q♠ Q♥ 9♣ 9♦ 2♠
        
        9. One Pair:
          Two cards of the same rank.
          Example: J♦ J♣ 8♠ 6♥ 5♦
        
        10. High Card:
        No other hand is made.
        Example: A♦ K♠ 8♣ 7♦ 4♥''',
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Go Back",
                          style: TextStyle(
                            // fontFamily: 'Atma',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
