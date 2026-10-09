import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    final n = nums.length;
    if (n == 1) return nums[0];

    var best = 0;
    // Each bit of mask says whether that house is robbed (2^n possible sets).
    for (var mask = 0; mask < (1 << n); mask++) {
      var legal = true;
      var total = 0;
      for (var i = 0; i < n; i++) {
        final robbed = ((mask >> i) & 1) == 1;
        final nextRobbed = ((mask >> ((i + 1) % n)) & 1) == 1;
        // Two neighbours on the circle can't both be robbed.
        if (robbed && nextRobbed) {
          legal = false;
          break;
        }
        if (robbed) total += nums[i];
      }
      if (legal) best = max(best, total);
    }
    return best;
  }
}
