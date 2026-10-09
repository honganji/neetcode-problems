import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    final n = nums.length;
    if (n == 1) return nums[0];
    // Breaking the circle at either end leaves a straight line of houses.
    return max(_robRange(nums, 0, n - 2), _robRange(nums, 1, n - 1));
  }

  int _robRange(List<int> nums, int start, int end) {
    // Classic "House Robber" on a straight line, using two rolling values.
    var prev2 = 0; // best total up to two houses back
    var prev1 = 0; // best total up to one house back
    for (var i = start; i <= end; i++) {
      final current = max(prev1, prev2 + nums[i]);
      prev2 = prev1;
      prev1 = current;
    }
    return prev1;
  }
}
