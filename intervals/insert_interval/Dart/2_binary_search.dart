import 'dart:math';

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    var start = newInterval[0];
    var end = newInterval[1];

    // The intervals that overlap newInterval form one contiguous block,
    // intervals[lo..hi). Two binary searches find its edges.
    // lo: first interval that ends at or after newInterval starts.
    final lo = _firstIndex(intervals, (iv) => iv[1] >= start);
    // hi: first interval that starts after newInterval ends.
    final hi = _firstIndex(intervals, (iv) => iv[0] > end);

    // Merge the overlapping block (if any) into newInterval.
    if (lo < hi) {
      start = min(start, intervals[lo][0]);
      end = max(end, intervals[hi - 1][1]);
    }

    return [
      ...intervals.sublist(0, lo),
      [start, end],
      ...intervals.sublist(hi),
    ];
  }

  // Binary search. Works because test is false for a prefix and true after it.
  int _firstIndex(List<List<int>> intervals, bool Function(List<int>) test) {
    var lo = 0;
    var hi = intervals.length;
    while (lo < hi) {
      final mid = (lo + hi) ~/ 2;
      if (test(intervals[mid])) {
        hi = mid;
      } else {
        lo = mid + 1;
      }
    }
    return lo;
  }
}
