int eraseOverlapIntervals(List<List<int>> intervals) {
  // Sort by start so the kept intervals are visited left to right.
  intervals.sort((a, b) => a[0].compareTo(b[0]));

  // For each interval, either keep it (if it fits after the last kept one)
  // or skip it. Try both and return the most we can keep.
  int mostKept(int i, int? lastEnd) {
    if (i == intervals.length) return 0;

    final skip = mostKept(i + 1, lastEnd);
    final start = intervals[i][0];
    final end = intervals[i][1];
    if (lastEnd != null && start < lastEnd) return skip;

    final take = 1 + mostKept(i + 1, end);
    return take > skip ? take : skip;
  }

  return intervals.length - mostKept(0, null);
}
