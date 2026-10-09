import 'dart:math';

int maxSubArray(List<int> nums) {
  var best = nums[0];
  for (var start = 0; start < nums.length; start++) {
    var total = 0;
    // Grow the subarray one element at a time from this start point.
    for (var end = start; end < nums.length; end++) {
      total += nums[end];
      best = max(best, total);
    }
  }
  return best;
}
