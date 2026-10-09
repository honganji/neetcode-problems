import 'dart:math';

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    // Add the new interval, then sort everything by start time.
    final all = [...intervals, newInterval]
      ..sort((a, b) => a[0].compareTo(b[0]));

    // Merge neighbours that overlap, like the Merge Intervals problem.
    final merged = <List<int>>[];
    for (final interval in all) {
      if (merged.isNotEmpty && interval[0] <= merged.last[1]) {
        merged.last[1] = max(merged.last[1], interval[1]);
      } else {
        merged.add([interval[0], interval[1]]);
      }
    }
    return merged;
  }
}
