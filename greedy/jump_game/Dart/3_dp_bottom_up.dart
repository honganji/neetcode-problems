import 'dart:math';

class Solution {
  bool canJump(List<int> nums) {
    final n = nums.length;
    // canReach[i] is true if the last index can be reached from index i
    final canReach = List<bool>.filled(n, false);
    canReach[n - 1] = true;
    for (var i = n - 2; i >= 0; i--) {
      final furthest = min(i + nums[i], n - 1);
      for (var j = i + 1; j <= furthest; j++) {
        if (canReach[j]) {
          canReach[i] = true;
          break;
        }
      }
    }
    return canReach[0];
  }
}
