import 'dart:math';

class Solution {
  int maxProduct(List<int> nums) {
    // Scan left-to-right and right-to-left, keeping running products.
    // A zero resets the running product, starting a fresh zero-free block.
    final n = nums.length;
    var best = nums[0];
    var prefix = 1;
    var suffix = 1;
    for (var i = 0; i < n; i++) {
      prefix *= nums[i];
      suffix *= nums[n - 1 - i];
      best = max(best, max(prefix, suffix));
      if (prefix == 0) prefix = 1;
      if (suffix == 0) suffix = 1;
    }
    return best;
  }
}
