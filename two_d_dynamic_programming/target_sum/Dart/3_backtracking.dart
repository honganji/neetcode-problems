int findTargetSumWays(List<int> nums, int target) {
  int backtrack(int i, int current) {
    if (i == nums.length) return current == target ? 1 : 0;
    // give nums[i] a "+" sign, then a "-" sign
    return backtrack(i + 1, current + nums[i]) +
        backtrack(i + 1, current - nums[i]);
  }

  return backtrack(0, 0);
}
