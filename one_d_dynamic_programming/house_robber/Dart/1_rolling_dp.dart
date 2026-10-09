import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    // robPrev: best total using the houses before the last one
    // robLast: best total using all houses seen so far
    var robPrev = 0;
    var robLast = 0;
    for (final money in nums) {
      // either skip this house, or rob it and add it to robPrev
      final next = max(robLast, robPrev + money);
      robPrev = robLast;
      robLast = next;
    }
    return robLast;
  }
}
