enum PokerHand {
  RoyalFlush,
  StraightFlush,
  FourOfAKind,
  FullHouse,
  Flush,
  Straight,
  ThreeOfAKind,
  TwoPair,
  OnePair,
  HighCard,
}

const List<String> pokerHandStrings = [
  'Royal Flush',
  'Straight Flush',
  'Four of a Kind',
  'Full House',
  'Flush',
  'Straight',
  'Three of a Kind',
  'Two Pair',
  'One Pair',
  'High Card',
];

const List<String> pokerHandsDescription = [
  "Rank 1. Royal Flush",
  "Rank 2. Straight Flush",
  "Rank 3. Four of a Kind",
  "Rank 4. Full House",
  "Rank 5. Flush",
  "Rank 6. Straight",
  "Rank 7. Three of a Kind",
  "Rank 8. Two Pair",
  "Rank 9. One Pair",
  "Rank 10. High Card"
];

const List<String> pokerHandsDescriptionOnly = [
  "A, K, Q, J, 10 of the same suit.\nHighest possible hand. Extremely rare.",
  "Five consecutive cards of the same suit.\nExample: 8♠ 7♠ 6♠ 5♠ 4♠",
  "Four cards of the same rank.\nExample: 9♦ 9♠ 9♣ 9♥ J♥",
  "Three cards of one rank and two of another.\nExample: A♠ A♦ A♣ 6♥ 6♠",
  "Five cards of the same suit, not in sequence.\nExample: K♣ 10♣ 7♣ 4♣ 3♣",
  "Five consecutive cards of any suit.\nExample: 10♦ 9♠ 8♥ 7♠ 6♦",
  "Three cards of the same rank.\nExample: 7♣ 7♠ 7♦ J♠ 5♣",
  "Two cards of one rank, two of another.\nExample: Q♠ Q♥ 9♣ 9♦ 2♠",
  "Two cards of the same rank.\nExample: J♦ J♣ 8♠ 6♥ 5♦",
  "No other hand is made.\nExample: A♦ K♠ 8♣ 7♦ 4♥"
];
