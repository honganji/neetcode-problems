import 'dart:math';

class Solution {
  int maxProduct(List<int> nums) {
    // Try every subarray by fixing a start and extending the end.
    var best = nums[0];
    for (var i = 0; i < nums.length; i++) {
      var product = 1;
      for (var j = i; j < nums.length; j++) {
        product *= nums[j];
        best = max(best, product);
      }
    }
    return best;
  }
}
