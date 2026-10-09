class Solution {
  bool isNStraightHand(List<int> hand, int groupSize) {
    if (hand.length % groupSize != 0) return false;

    final cards = List<int>.from(hand);
    while (cards.isNotEmpty) {
      // The smallest remaining card must start the next group.
      var lowest = cards.first;
      for (final card in cards) {
        if (card < lowest) lowest = card;
      }
      for (var v = lowest; v < lowest + groupSize; v++) {
        if (!cards.remove(v)) return false;
      }
    }
    return true;
  }
}
