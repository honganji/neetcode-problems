import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    // best total for houses i onward, recomputed on every call
    int tryFrom(int i) {
      if (i >= nums.length) return 0;
      final skip = tryFrom(i + 1);
      final take = nums[i] + tryFrom(i + 2);
      return max(skip, take);
    }

    return tryFrom(0);
  }
}
