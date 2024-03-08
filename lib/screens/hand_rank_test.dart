import 'package:flutter/material.dart';
import '../constants.dart';
import '../services/hand_ranking_test_manager.dart';

class HandRankTestScreen extends StatefulWidget {
  const HandRankTestScreen({Key? key}) : super(key: key);

  @override
  State<HandRankTestScreen> createState() => _HandRankTestScreenState();
}

class _HandRankTestScreenState extends State<HandRankTestScreen> {
  final HandRankTestManager _handrankTestManager = HandRankTestManager();

  // STATES
  bool _userAnswered = false;
  bool _userIsCorrect = false;

  bool _pickedTop = false;
  bool _pickeBottom = false;

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
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Visibility(
                          visible: _pickedTop,
                          child: const SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "You Picked ",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.amber,
                                ),
                              ),
                            ),
                          )),
                      ..._handrankTestManager
                          .renderTopPokerHand()
                          .map((e) => SizedBox(
                                width: 80,
                                child: e,
                              ))
                          .toList(),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _userAnswered
                            ? (_userIsCorrect ? "Correct" : "Incorrect")
                            : "Which Poker Hand has a Higher Ranking?\n( 1 being the highest and 10 being the lowest)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: _userAnswered ? FontWeight.bold : null,
                          color: (_userAnswered && !_userIsCorrect)
                              ? Colors.red
                              : null,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: _userAnswered ? 2 : 1,
                      child: Column(
                        children: [
                          Visibility(
                              visible: _userAnswered,
                              child: Text(pokerHandsDescription[
                                  _handrankTestManager.cards1Index])),
                          Visibility(
                            visible: !_userAnswered,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ElevatedButton(
                                  onPressed: () => setState(() {
                                    _pickedTop = true;
                                    _userAnswered = true;
                                    _userIsCorrect = _handrankTestManager
                                        .isTopPokerDeckHigher();
                                  }),
                                  child: const Text(
                                    "Top Poker Hand",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: _userAnswered ? null : double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 10.0),
                              child: ElevatedButton(
                                onPressed: () => setState(() {
                                  if (!_userAnswered) {
                                    _pickeBottom = true;
                                    _pickedTop = true;
                                    _userAnswered = true;
                                    _userIsCorrect =
                                        _handrankTestManager.isTheSameRank();
                                  } else {
                                    _userAnswered = false;
                                    _pickeBottom = false;
                                    _pickedTop = false;
                                    // generate new question
                                    _handrankTestManager.getQuestion();
                                  }
                                }),
                                child: _userAnswered
                                    ? const Row(
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
                                      )
                                    : const Text(
                                        "Both are the same",
                                      ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !_userAnswered,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ElevatedButton(
                                  onPressed: () => setState(() {
                                    _pickeBottom = true;
                                    _userAnswered = true;
                                    _userIsCorrect = _handrankTestManager
                                        .isBottomPokerDeckHigher();
                                  }),
                                  child: const Text(
                                    "Bottom Poker Hand",
                                    // style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: _userAnswered,
                              child: Text(pokerHandsDescription[
                                  _handrankTestManager.cards2Index])),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    verticalDirection: VerticalDirection.up,
                    children: [
                      Visibility(
                          visible: _pickeBottom,
                          child: const SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "You Picked ",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.amber,
                                ),
                              ),
                            ),
                          )),
                      ..._handrankTestManager
                          .renderBottomPokerHand()
                          .map((e) => SizedBox(
                                width: 80,
                                child: e,
                              ))
                          .toList(),
                    ],
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
