import 'dart:math';

class Solution {
  List<int> partitionLabels(String s) {
    // First and last index of each letter (-1 means the letter is absent).
    final first = List<int>.filled(26, -1);
    final last = List<int>.filled(26, -1);
    for (var i = 0; i < s.length; i++) {
      final c = s.codeUnitAt(i) - 97;
      if (first[c] == -1) first[c] = i;
      last[c] = i;
    }

    // Each letter covers an interval; sort them by start.
    final intervals = <List<int>>[];
    for (var c = 0; c < 26; c++) {
      if (first[c] != -1) intervals.add([first[c], last[c]]);
    }
    intervals.sort((a, b) => a[0].compareTo(b[0]));

    // Merge overlapping intervals; each merged block is one part.
    final result = <int>[];
    var start = intervals[0][0];
    var end = intervals[0][1];
    for (final iv in intervals.skip(1)) {
      if (iv[0] > end) {
        result.add(end - start + 1);
        start = iv[0];
        end = iv[1];
      } else {
        end = max(end, iv[1]);
      }
    }
    result.add(end - start + 1);
    return result;
  }
}
