int lastStoneWeight(List<int> stones) {
  final sorted = List<int>.of(stones)..sort(); // ascending, so the heaviest are at the end

  while (sorted.length > 1) {
    final heaviest = sorted.removeLast();
    final second = sorted.removeLast();
    if (heaviest != second) {
      final diff = heaviest - second;
      // binary search for the first index whose value is >= diff
      var lo = 0;
      var hi = sorted.length;
      while (lo < hi) {
        final mid = (lo + hi) ~/ 2;
        if (sorted[mid] < diff) {
          lo = mid + 1;
        } else {
          hi = mid;
        }
      }
      sorted.insert(lo, diff);
    }
  }

  return sorted.isEmpty ? 0 : sorted.first;
}
