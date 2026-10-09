import 'dart:math';

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    final result = <List<int>>[];
    final n = intervals.length;
    var i = 0;

    // 1. Intervals that end before newInterval starts: keep as-is.
    while (i < n && intervals[i][1] < newInterval[0]) {
      result.add(intervals[i]);
      i++;
    }

    // 2. Intervals that overlap newInterval: absorb them into one bigger interval.
    var start = newInterval[0];
    var end = newInterval[1];
    while (i < n && intervals[i][0] <= end) {
      start = min(start, intervals[i][0]);
      end = max(end, intervals[i][1]);
      i++;
    }
    result.add([start, end]);

    // 3. Intervals that start after newInterval ends: keep as-is.
    result.addAll(intervals.sublist(i));
    return result;
  }
}
