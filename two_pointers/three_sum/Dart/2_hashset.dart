List<List<int>> threeSum(List<int> nums) {
  nums.sort();
  final result = <List<int>>[];
  for (var i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) continue;
    if (nums[i] > 0) break;
    final seen = <int>{};
    var j = i + 1;
    while (j < nums.length) {
      final complement = -nums[i] - nums[j];
      if (seen.contains(complement)) {
        result.add([nums[i], complement, nums[j]]);
        while (j + 1 < nums.length && nums[j] == nums[j + 1]) {
          j++;
        }
      }
      seen.add(nums[j]);
      j++;
    }
  }
  return result;
}
