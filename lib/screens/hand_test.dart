import 'package:flutter/material.dart';
import 'package:poker_hand_guru/services/hand_test_manager.dart';
import '../constants.dart';

class HandTestScreen extends StatefulWidget {
  const HandTestScreen({Key? key}) : super(key: key);

  @override
  State<HandTestScreen> createState() => _HandTestScreenState();
}

class _HandTestScreenState extends State<HandTestScreen> {
  final HandTestManager _handTestManager = HandTestManager();

  // STATES
  bool _userAnswered = false;
  // bool _questionsFinished = false;

  late PokerHand _userAnswer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const Text(
                  "What Poker Hand is Shown Below",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ..._handTestManager
                          .renderPokerHand()
                          .map((e) => SizedBox(
                                width: 100,
                                child: e,
                              ))
                          .toList()
                    ],
                  ),
                ),

                // user answered state

                if (_userAnswered) ...[
                  const Spacer(),
                  const Spacer(),
                  if (_handTestManager.checkIfCorrect(_userAnswer))
                    const Text(
                      "Correct",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (!_handTestManager.checkIfCorrect(_userAnswer))
                    const Text(
                      "Incorrect",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  Text(
                    "Correct Answer: ${pokerHandStrings[_handTestManager.correctAnswerIndex]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                  Text(
                    pokerHandsDescriptionOnly[
                        _handTestManager.correctAnswerIndex],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ElevatedButton(
                      onPressed: () => setState(() {
                        _userAnswered = false;
                        _handTestManager.getQuestion();
                      }),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.play_arrow,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Show another poker hand",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                // user picks state
                const Spacer(),
                Visibility(
                  visible: !_userAnswered,
                  child: Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        for (int i = 0; i < PokerHand.values.length; i++)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: ElevatedButton(
                              onPressed: () => setState(() {
                                _userAnswer = PokerHand.values[i];
                                _userAnswered = true;
                                // _currentHand = PokerHand.values[i];
                              }),
                              child: Text(
                                pokerHandStrings[i],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Set the background color
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Quit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
