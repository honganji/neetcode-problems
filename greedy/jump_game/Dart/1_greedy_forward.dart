import 'dart:math';

class Solution {
  bool canJump(List<int> nums) {
    // Farthest index we can reach so far
    var farthest = 0;
    for (var i = 0; i < nums.length; i++) {
      // Index i is past every reachable index, so it can never be reached
      if (i > farthest) return false;
      farthest = max(farthest, i + nums[i]);
    }
    return true;
  }
}
