import 'dart:math';

List<List<int>> mergeIntervals(List<List<int>> intervals) {
  if (intervals.isEmpty) return [];
  // Double every coordinate: point x is cell 2x, the gap (x, x+1) is cell 2x+1.
  // Then [1, 4] and [4, 5] touch (no gap cell), but [1, 4] and [5, 6] do not.
  final maxEnd = intervals.map((iv) => iv[1]).reduce(max);
  final limit = 2 * maxEnd + 2;
  final diff = List<int>.filled(limit + 1, 0);
  for (final iv in intervals) {
    diff[2 * iv[0]] += 1; // coverage begins at this cell
    diff[2 * iv[1] + 1] -= 1; // and stops right after this interval's last cell
  }

  final merged = <List<int>>[];
  var covered = 0; // how many intervals cover the current cell
  var openStart = -1; // first cell of the run we are inside, or -1
  for (var cell = 0; cell < limit; cell++) {
    covered += diff[cell];
    if (covered > 0 && openStart == -1) {
      openStart = cell;
    } else if (covered == 0 && openStart != -1) {
      merged.add([openStart ~/ 2, (cell - 1) ~/ 2]);
      openStart = -1;
    }
  }
  return merged;
}
