import 'dart:math';

List<List<int>> mergeIntervals(List<List<int>> intervals) {
  final sorted = [...intervals]..sort((a, b) => a[0].compareTo(b[0])); // sort by start
  final merged = <List<int>>[];
  for (final interval in sorted) {
    if (merged.isNotEmpty && interval[0] <= merged.last[1]) {  // overlaps or touches
      merged.last[1] = max(merged.last[1], interval[1]);
    } else {
      merged.add([interval[0], interval[1]]);
    }
  }
  return merged;
}
