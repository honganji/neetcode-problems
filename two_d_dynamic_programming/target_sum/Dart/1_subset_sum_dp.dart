int findTargetSumWays(List<int> nums, int target) {
  final total = nums.fold(0, (a, b) => a + b);
  // Out of reach, or the parity is wrong: no way to hit the target.
  if (target.abs() > total || (total + target) % 2 != 0) return 0;

  // Numbers given "+" form a group P, the rest get "-":
  // sum(P) - (total - sum(P)) = target, so sum(P) = (total + target) / 2.
  // Counting sign choices is the same as counting subsets with that sum.
  final goal = (total + target) ~/ 2;
  final ways = List<int>.filled(goal + 1, 0); // ways[s] = subsets summing to s
  ways[0] = 1; // the empty subset

  for (final num in nums) {
    // Go downward so each number is used at most once.
    for (var s = goal; s >= num; s--) {
      ways[s] += ways[s - num];
    }
  }

  return ways[goal];
}
