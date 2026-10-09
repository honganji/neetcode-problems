List<List<int>> subsetsWithDup(List<int> nums) {
  final n = nums.length;
  final seen = <String>{};
  final result = <List<int>>[];

  // Every bit pattern is one candidate subset.
  for (var mask = 0; mask < (1 << n); mask++) {
    final subset = <int>[];
    for (var i = 0; i < n; i++) {
      if ((mask & (1 << i)) != 0) subset.add(nums[i]);
    }
    // Sorting makes [1, 2] and [2, 1] the same key.
    subset.sort();
    if (seen.add(subset.join(','))) {
      result.add(subset);
    }
  }
  return result;
}
