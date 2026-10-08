List<int> twoSum(List<int> nums, int target) {
  final indexed = List<int>.generate(nums.length, (i) => i)
    ..sort((a, b) => nums[a].compareTo(nums[b]));
  var left = 0;
  var right = nums.length - 1;
  while (left < right) {
    final total = nums[indexed[left]] + nums[indexed[right]];
    if (total == target) {
      return [indexed[left], indexed[right]];
    }
    if (total < target) {
      left++;
    } else {
      right--;
    }
  }
  return [];
}
