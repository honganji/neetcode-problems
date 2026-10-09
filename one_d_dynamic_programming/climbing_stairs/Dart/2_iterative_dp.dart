class Solution {
  int climbStairs(int n) {
    // ways[i] = ways[i - 1] + ways[i - 2], and only the last two values are needed.
    var prev = 1; // ways to reach step 0
    var curr = 1; // ways to reach step 1
    for (var i = 2; i <= n; i++) {
      final next = prev + curr;
      prev = curr;
      curr = next;
    }
    return curr;
  }
}
