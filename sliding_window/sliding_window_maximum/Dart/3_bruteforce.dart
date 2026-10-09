List<int> maxSlidingWindow(List<int> nums, int k) {
  final result = <int>[];
  for (var i = 0; i + k <= nums.length; i++) {
    var best = nums[i];
    for (var j = i + 1; j < i + k; j++) {
      if (nums[j] > best) best = nums[j];
    }
    result.add(best);
  }
  return result;
}
