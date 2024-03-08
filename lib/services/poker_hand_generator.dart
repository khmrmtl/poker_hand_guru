import 'dart:math';
import 'package:playing_cards/playing_cards.dart';

import '../constants.dart';

class PokerHandGenerator {
  static final PokerHandGenerator _instance = PokerHandGenerator._internal();

  factory PokerHandGenerator() {
    return _instance;
  }

  PokerHandGenerator._internal();

  List<PlayingCardView> renderPokerHand(PokerHand hand) {
    // Implement logic to map hand names to cards and create PlayingCardView widgets
    // For demonstration purposes, we will create a fixed set of cards based on the hand name
    switch (hand) {
      case PokerHand.RoyalFlush:
        Suit handSuit = _getRandomSuit();
        List<PlayingCardView> royalFlushHand = [
          PlayingCardView(card: PlayingCard(handSuit, CardValue.ace)),
          PlayingCardView(card: PlayingCard(handSuit, CardValue.king)),
          PlayingCardView(card: PlayingCard(handSuit, CardValue.queen)),
          PlayingCardView(card: PlayingCard(handSuit, CardValue.jack)),
          PlayingCardView(card: PlayingCard(handSuit, CardValue.ten)),
        ];
        royalFlushHand.shuffle();
        return royalFlushHand;

      case PokerHand.StraightFlush:
        Suit handSuit = _getRandomSuit();
        var random = Random();
        int randomNumber = random.nextInt(CardValue.values.length - 7);
        List<PlayingCardView> straightFlushHand = [
          PlayingCardView(
              card: PlayingCard(handSuit, CardValue.values[randomNumber])),
          PlayingCardView(
              card: PlayingCard(handSuit, CardValue.values[randomNumber + 1])),
          PlayingCardView(
              card: PlayingCard(handSuit, CardValue.values[randomNumber + 2])),
          PlayingCardView(
              card: PlayingCard(handSuit, CardValue.values[randomNumber + 3])),
          PlayingCardView(
              card: PlayingCard(handSuit, CardValue.values[randomNumber + 4])),
        ];
        straightFlushHand.shuffle();
        return straightFlushHand;

      case PokerHand.FourOfAKind:
        CardValue rankOfFourCards = _getRandomCardRank();
        CardValue tempOther = _getRandomCardRank();
        CardValue rankOfTheOther =
            (tempOther == rankOfFourCards) ? CardValue.jack : tempOther;
        List<PlayingCardView> fourOfAKindhHand = [
          PlayingCardView(card: PlayingCard(Suit.diamonds, rankOfFourCards)),
          PlayingCardView(card: PlayingCard(Suit.hearts, rankOfFourCards)),
          PlayingCardView(card: PlayingCard(Suit.spades, rankOfFourCards)),
          PlayingCardView(card: PlayingCard(Suit.clubs, rankOfFourCards)),
          PlayingCardView(card: PlayingCard(_getRandomSuit(), rankOfTheOther)),
        ];
        fourOfAKindhHand.shuffle();
        return fourOfAKindhHand;

      case PokerHand.FullHouse:
        CardValue threeRank = _getRandomCardRank();
        List<Suit> threeRankSuit = _getRandomThreeSuit(); // length = 3
        CardValue tempRank = _getRandomCardRank();
        CardValue rankOfTheOtherTwo =
            (tempRank == threeRank) ? CardValue.jack : tempRank;
        List<Suit> twoRankSuit = _getRandomTwoSuit(); // length = 2
        List<PlayingCardView> fullHouseHand = [
          PlayingCardView(card: PlayingCard(threeRankSuit[0], threeRank)),
          PlayingCardView(card: PlayingCard(threeRankSuit[1], threeRank)),
          PlayingCardView(card: PlayingCard(threeRankSuit[2], threeRank)),
          PlayingCardView(card: PlayingCard(twoRankSuit[0], rankOfTheOtherTwo)),
          PlayingCardView(card: PlayingCard(twoRankSuit[1], rankOfTheOtherTwo)),
        ];
        fullHouseHand.shuffle();
        return fullHouseHand;

      case PokerHand.Flush:
        Suit suit = _getRandomSuit();
        List<int> nonsequentialRanks =
            _generate5NonSequentialUniqueRandomNumbers(); // length = 5

        List<PlayingCardView> flushHand = [
          PlayingCardView(
              card: PlayingCard(suit, CardValue.values[nonsequentialRanks[0]])),
          PlayingCardView(
              card: PlayingCard(suit, CardValue.values[nonsequentialRanks[1]])),
          PlayingCardView(
              card: PlayingCard(suit, CardValue.values[nonsequentialRanks[2]])),
          PlayingCardView(
              card: PlayingCard(suit, CardValue.values[nonsequentialRanks[3]])),
          PlayingCardView(
              card: PlayingCard(suit, CardValue.values[nonsequentialRanks[4]])),
        ];
        flushHand.shuffle();
        return flushHand;

      case PokerHand.Straight:
        var random = Random();
        int randomNumber = random.nextInt(CardValue.values.length - 6);
        List<PlayingCardView> straightHand = [
          PlayingCardView(
              card: PlayingCard(Suit.hearts, CardValue.values[randomNumber])),
          PlayingCardView(
              card:
                  PlayingCard(Suit.spades, CardValue.values[randomNumber + 1])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[randomNumber + 2])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[randomNumber + 3])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[randomNumber + 4])),
        ];
        straightHand.shuffle();
        return straightHand;

      case PokerHand.ThreeOfAKind:
        List<int> threeRank =
            _generate3NonSequentialUniqueRandomNumbers(); // lenght = 3
        List<Suit> threeSuits = _getRandomThreeSuit();
        List<Suit> twoSuits = _getRandomTwoSuit();

        List<PlayingCardView> threeOfAKindHand = [
          PlayingCardView(
              card: PlayingCard(threeSuits[0], CardValue.values[threeRank[0]])),
          PlayingCardView(
              card: PlayingCard(threeSuits[1], CardValue.values[threeRank[0]])),
          PlayingCardView(
              card: PlayingCard(threeSuits[2], CardValue.values[threeRank[0]])),
          PlayingCardView(
              card: PlayingCard(twoSuits[0], CardValue.values[threeRank[1]])),
          PlayingCardView(
              card: PlayingCard(twoSuits[1], CardValue.values[threeRank[2]])),
        ];
        threeOfAKindHand.shuffle();
        return threeOfAKindHand;

      case PokerHand.TwoPair:
        List<int> threeRank =
            _generate3NonSequentialUniqueRandomNumbers(); // lenght = 3
        List<Suit> twoSuits = _getRandomTwoSuit();
        List<Suit> twoSuits2 = _getRandomTwoSuit();

        List<PlayingCardView> twoPairHand = [
          PlayingCardView(
              card: PlayingCard(twoSuits[0], CardValue.values[threeRank[0]])),
          PlayingCardView(
              card: PlayingCard(twoSuits[1], CardValue.values[threeRank[0]])),
          PlayingCardView(
              card: PlayingCard(twoSuits2[1], CardValue.values[threeRank[1]])),
          PlayingCardView(
              card: PlayingCard(twoSuits2[0], CardValue.values[threeRank[1]])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[threeRank[2]])),
        ];
        twoPairHand.shuffle();
        return twoPairHand;

      case PokerHand.OnePair:
        List<int> rankIndex = _generate5NonSequentialUniqueRandomNumbers();
        List<Suit> twoSuits = _getRandomTwoSuit();

        List<PlayingCardView> onePairHand = [
          PlayingCardView(
              card: PlayingCard(twoSuits[0], CardValue.values[rankIndex[0]])),
          PlayingCardView(
              card: PlayingCard(twoSuits[1], CardValue.values[rankIndex[0]])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[rankIndex[1]])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[rankIndex[2]])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[rankIndex[3]])),
        ];
        onePairHand.shuffle();
        return onePairHand;

      case PokerHand.HighCard:
        List<int> rankIndex = _generate5NonSequentialUniqueRandomNumbers();

        List<PlayingCardView> highCardHand = [
          PlayingCardView(
              card: PlayingCard(Suit.clubs, CardValue.values[rankIndex[0]])),
          PlayingCardView(
              card: PlayingCard(Suit.diamonds, CardValue.values[rankIndex[1]])),
          PlayingCardView(
              card: PlayingCard(Suit.hearts, CardValue.values[rankIndex[2]])),
          PlayingCardView(
              card: PlayingCard(Suit.spades, CardValue.values[rankIndex[3]])),
          PlayingCardView(
              card: PlayingCard(
                  _getRandomSuit(), CardValue.values[rankIndex[4]])),
        ];
        highCardHand.shuffle();
        return highCardHand;
    }
  }

  Suit _getRandomSuit() {
    var random = Random();
    int randomNumber = random.nextInt(Suit.values.length - 1);

    return Suit.values[randomNumber];
  }

  List<Suit> _getRandomThreeSuit() {
    var random = Random();
    int randomNumber = random.nextInt(Suit.values.length - 1);

    List<Suit> suits = [];
    for (int i = 0; i < Suit.values.length - 1; i++) {
      if (randomNumber != i) {
        suits.add(Suit.values[i]);
      }
    }
    return suits;
  }

  List<Suit> _getRandomTwoSuit() {
    var random = Random();
    int randomNumber = random.nextInt(Suit.values.length - 1);
    int randomNumber2;

    do {
      randomNumber2 = random.nextInt(Suit.values.length - 1);
    } while (randomNumber2 == randomNumber);

    List<Suit> suits = [];
    for (int i = 0; i < Suit.values.length - 1; i++) {
      if (randomNumber != i && randomNumber2 != i) {
        suits.add(Suit.values[i]);
      }
    }
    return suits;
  }

  CardValue _getRandomCardRank() {
    var random = Random();
    int randomNumber = random.nextInt(CardValue.values.length - 2);

    return CardValue.values[randomNumber];
  }

  List<int> _generate5NonSequentialUniqueRandomNumbers() {
    int count = 5;
    int maxValue = 12;

    var random = Random();
    Set<int> uniqueNumbers = {};

    while (uniqueNumbers.length < count) {
      int randomNumber = random.nextInt(maxValue + 1);
      uniqueNumbers.add(randomNumber);
      // ensures random numbers are not sequencial
      if (uniqueNumbers.length == 1) {
        if (uniqueNumbers.first < 11) {
          uniqueNumbers.add(uniqueNumbers.first + 2);
        } else {
          uniqueNumbers.add(uniqueNumbers.first - 2);
        }
      }
    }

    return uniqueNumbers.toList();
  }

  List<int> _generate3NonSequentialUniqueRandomNumbers() {
    int count = 3;
    int maxValue = 12;

    var random = Random();
    Set<int> uniqueNumbers = {};

    while (uniqueNumbers.length < count) {
      int randomNumber = random.nextInt(maxValue + 1);
      uniqueNumbers.add(randomNumber);
      // ensures random numbers are not sequencial
      if (uniqueNumbers.length == 1) {
        if (uniqueNumbers.first < 11) {
          uniqueNumbers.add(uniqueNumbers.first + 2);
        } else {
          uniqueNumbers.add(uniqueNumbers.first - 2);
        }
      }
    }

    return uniqueNumbers.toList();
  }
}
