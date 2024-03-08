import 'dart:math';

import 'package:playing_cards/playing_cards.dart';
import 'package:poker_hand_guru/services/poker_hand_generator.dart';

import '../constants.dart';

class HandTestManager {
  final PokerHandGenerator _pokerHandGenerator = PokerHandGenerator();
  int correctlyAnswered = 0;

  int questionNumber = 0;

  late PokerHand _correctAnswer;
  late int correctAnswerIndex;

  late List<PlayingCardView> _cardsShown;

  HandTestManager() {
    getQuestion();
  }

  void getQuestion() {
    questionNumber++;
    Random random = Random();
    correctAnswerIndex = random.nextInt(PokerHand.values.length);
    _correctAnswer = PokerHand.values[correctAnswerIndex];
    _cardsShown = _pokerHandGenerator.renderPokerHand(_correctAnswer);
  }

  bool checkIfCorrect(PokerHand selectedHand) {
    bool isCorrect = selectedHand == _correctAnswer;
    if (isCorrect) correctlyAnswered++;
    return isCorrect;
  }

  List<PlayingCardView> renderPokerHand() {
    return _cardsShown;
  }
}
