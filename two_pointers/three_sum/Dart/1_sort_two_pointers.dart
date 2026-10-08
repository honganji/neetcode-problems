List<List<int>> threeSum(List<int> nums) {
  nums.sort();
  final result = <List<int>>[];
  for (var i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) continue;
    if (nums[i] > 0) break;
    var left = i + 1;
    var right = nums.length - 1;
    while (left < right) {
      final total = nums[i] + nums[left] + nums[right];
      if (total < 0) {
        left++;
      } else if (total > 0) {
        right--;
      } else {
        result.add([nums[i], nums[left], nums[right]]);
        left++;
        right--;
        while (left < right && nums[left] == nums[left - 1]) {
          left++;
        }
        while (left < right && nums[right] == nums[right + 1]) {
          right--;
        }
      }
    }
  }
  return result;
}
