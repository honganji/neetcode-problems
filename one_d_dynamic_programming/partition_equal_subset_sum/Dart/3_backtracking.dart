class Solution {
  bool canPartition(List<int> nums) {
    final total = nums.fold<int>(0, (sum, n) => sum + n);
    if (total.isOdd) return false;

    bool dfs(int i, int remaining) {
      // Found a subset with the exact target sum.
      if (remaining == 0) return true;
      // Ran out of numbers, or overshot the target.
      if (i == nums.length || remaining < 0) return false;
      // Try taking nums[i], or skipping it.
      return dfs(i + 1, remaining - nums[i]) || dfs(i + 1, remaining);
    }

    return dfs(0, total ~/ 2);
  }
}
