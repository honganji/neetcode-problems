import 'dart:math';

class Solution {
  List<int> partitionLabels(String s) {
    // Remember where each letter appears last.
    final last = List<int>.filled(26, 0);
    for (var i = 0; i < s.length; i++) {
      last[s.codeUnitAt(i) - 97] = i;
    }

    final result = <int>[];
    var start = 0; // where the current part begins
    var end = 0; // furthest last-occurrence seen in the current part
    for (var i = 0; i < s.length; i++) {
      end = max(end, last[s.codeUnitAt(i) - 97]);
      // Every letter seen so far ends inside this part, so cut here.
      if (i == end) {
        result.add(end - start + 1);
        start = i + 1;
      }
    }
    return result;
  }
}
