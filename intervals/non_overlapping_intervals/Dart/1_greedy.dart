int eraseOverlapIntervals(List<List<int>> intervals) {
  if (intervals.isEmpty) return 0;

  // Sort by end time so the interval that finishes earliest comes first.
  intervals.sort((a, b) => a[1].compareTo(b[1]));

  var removed = 0;
  var lastEnd = intervals[0][1];
  for (var i = 1; i < intervals.length; i++) {
    final start = intervals[i][0];
    final end = intervals[i][1];
    if (start < lastEnd) {
      // Overlaps the interval we kept, so remove this one.
      removed++;
    } else {
      // No overlap, keep it and move the boundary forward.
      lastEnd = end;
    }
  }
  return removed;
}
