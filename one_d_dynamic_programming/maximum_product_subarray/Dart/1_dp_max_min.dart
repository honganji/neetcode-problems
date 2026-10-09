import 'dart:math';

class Solution {
  int maxProduct(List<int> nums) {
    // A negative number can turn the smallest product so far into the largest,
    // so track both the max and min product of subarrays ending at each index.
    var curMax = nums[0];
    var curMin = nums[0];
    var best = nums[0];
    for (var i = 1; i < nums.length; i++) {
      final x = nums[i];
      final a = curMax * x;
      final b = curMin * x;
      curMax = max(x, max(a, b));
      curMin = min(x, min(a, b));
      best = max(best, curMax);
    }
    return best;
  }
}
