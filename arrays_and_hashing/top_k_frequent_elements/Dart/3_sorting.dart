List<int> topKFrequent(List<int> nums, int k) {
  final counts = <int, int>{};
  for (final num in nums) {
    counts[num] = (counts[num] ?? 0) + 1;
  }

  final ordered = counts.keys.toList()
    ..sort((a, b) => counts[b]!.compareTo(counts[a]!));
  return ordered.sublist(0, k);
}
