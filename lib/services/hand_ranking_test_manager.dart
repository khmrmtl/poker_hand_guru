import 'dart:math';

import 'package:playing_cards/playing_cards.dart';
import 'package:poker_hand_guru/services/poker_hand_generator.dart';

import '../constants.dart';

class HandRankTestManager {
  final PokerHandGenerator _pokerHandGenerator = PokerHandGenerator();

  late List<PlayingCardView> _cards1;
  late int cards1Index;

  late List<PlayingCardView> _cards2;
  late int cards2Index;

  HandRankTestManager() {
    getQuestion();
  }

  void getQuestion() {
    Random random = Random();
    cards1Index = random.nextInt(PokerHand.values.length);
    _cards1 =
        _pokerHandGenerator.renderPokerHand(PokerHand.values[cards1Index]);

    Random random2 = Random();
    cards2Index = random2.nextInt(PokerHand.values.length);
    _cards2 =
        _pokerHandGenerator.renderPokerHand(PokerHand.values[cards2Index]);
  }

  bool isTopPokerDeckHigher() {
    return cards1Index < cards2Index;
  }

  bool isBottomPokerDeckHigher() {
    return cards2Index < cards1Index;
  }

  bool isTheSameRank() {
    return cards1Index == cards2Index;
  }

  List<PlayingCardView> renderTopPokerHand() {
    return _cards1;
  }

  List<PlayingCardView> renderBottomPokerHand() {
    return _cards2;
  }
}
