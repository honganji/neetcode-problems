import 'dart:math';

int maxSubArray(List<int> nums) {
  var best = nums[0];
  var current = 0;
  for (final num in nums) {
    // Either extend the running subarray or restart at this number,
    // whichever gives the larger sum.
    current = max(num, current + num);
    best = max(best, current);
  }
  return best;
}
