int eraseOverlapIntervals(List<List<int>> intervals) {
  if (intervals.isEmpty) return 0;

  // Sorting by end time means any interval that can come before interval i
  // in a chain has a smaller index.
  intervals.sort((a, b) => a[1].compareTo(b[1]));

  final n = intervals.length;
  // best[i] = most intervals we can keep, ending with interval i.
  final best = List<int>.filled(n, 1);
  var longest = 1;

  for (var i = 1; i < n; i++) {
    for (var j = 0; j < i; j++) {
      if (intervals[j][1] <= intervals[i][0] && best[j] + 1 > best[i]) {
        best[i] = best[j] + 1;
      }
    }
    if (best[i] > longest) longest = best[i];
  }

  return n - longest;
}
