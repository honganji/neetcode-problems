class Solution {
  bool isNStraightHand(List<int> hand, int groupSize) {
    if (hand.length % groupSize != 0) return false;

    final counts = <int, int>{};
    for (final card in hand) {
      counts[card] = (counts[card] ?? 0) + 1;
    }

    // Walk the distinct values from smallest to largest.
    final sortedValues = counts.keys.toList()..sort();
    for (final start in sortedValues) {
      final c = counts[start]!;
      if (c == 0) continue;
      // The smallest value left must start all of its remaining groups.
      for (var v = start; v < start + groupSize; v++) {
        final have = counts[v] ?? 0;
        if (have < c) return false;
        counts[v] = have - c;
      }
    }
    return true;
  }
}
