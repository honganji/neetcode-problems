List<int> topKFrequent(List<int> nums, int k) {
  final counts = <int, int>{};
  for (final num in nums) {
    counts[num] = (counts[num] ?? 0) + 1;
  }

  final buckets = List<List<int>>.generate(nums.length + 1, (_) => <int>[]);
  counts.forEach((num, freq) {
    buckets[freq].add(num);
  });

  final result = <int>[];
  for (var freq = buckets.length - 1; freq > 0; freq--) {
    for (final num in buckets[freq]) {
      result.add(num);
      if (result.length == k) {
        return result;
      }
    }
  }
  return result;
}
