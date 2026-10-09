class Solution {
  int climbStairs(int n) {
    final memo = <int, int>{};

    int ways(int i) {
      if (i <= 1) return 1;
      final cached = memo[i];
      if (cached != null) return cached;
      final result = ways(i - 1) + ways(i - 2);
      memo[i] = result;
      return result;
    }

    return ways(n);
  }
}
