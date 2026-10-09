class Solution {
  int change(int amount, List<int> coins) {
    int ways(int i, int remaining) {
      if (remaining < 0) return 0;
      if (remaining == 0) return 1;
      if (i == coins.length) return 0;
      // Either skip coins[i], or use it once and keep considering it.
      return ways(i + 1, remaining) + ways(i, remaining - coins[i]);
    }

    return ways(0, amount);
  }
}
