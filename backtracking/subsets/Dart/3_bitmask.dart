List<List<int>> subsets(List<int> nums) {
  final n = nums.length;
  final result = <List<int>>[];
  // Each mask from 0 to 2^n - 1 is a yes/no pattern: bit i set means nums[i] is included.
  for (var mask = 0; mask < (1 << n); mask++) {
    final subset = <int>[];
    for (var i = 0; i < n; i++) {
      if ((mask & (1 << i)) != 0) subset.add(nums[i]);
    }
    result.add(subset);
  }
  return result;
}
