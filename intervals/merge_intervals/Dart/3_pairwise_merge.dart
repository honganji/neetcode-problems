import 'dart:math';

List<List<int>> mergeIntervals(List<List<int>> intervals) {
  final merged = [for (final iv in intervals) [iv[0], iv[1]]]; // copy

  bool overlaps(List<int> a, List<int> b) => a[0] <= b[1] && b[0] <= a[1];

  // returns [i, j] for the first overlapping pair, or null if there is none
  List<int>? findOverlappingPair() {
    for (var i = 0; i < merged.length; i++) {
      for (var j = i + 1; j < merged.length; j++) {
        if (overlaps(merged[i], merged[j])) return [i, j];
      }
    }
    return null;
  }

  // keep merging any overlapping pair until no two intervals overlap
  for (var pair = findOverlappingPair(); pair != null; pair = findOverlappingPair()) {
    final i = pair[0];
    final j = pair[1];
    merged[i] = [min(merged[i][0], merged[j][0]), max(merged[i][1], merged[j][1])];
    merged.removeAt(j);
  }

  merged.sort((a, b) => a[0].compareTo(b[0]));
  return merged;
}
