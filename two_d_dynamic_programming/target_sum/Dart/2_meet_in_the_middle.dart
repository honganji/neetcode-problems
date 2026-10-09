int findTargetSumWays(List<int> nums, int target) {
  final half = nums.length ~/ 2;
  final left = nums.sublist(0, half);
  final right = nums.sublist(half);

  List<int> allSignedSums(List<int> values) {
    var sums = <int>[0];
    for (final v in values) {
      // every sum so far can take either +v or -v
      sums = [...sums.map((s) => s + v), ...sums.map((s) => s - v)];
    }
    return sums;
  }

  // For each right-half sum, the left half must produce target - that sum.
  final leftCounts = <int, int>{};
  for (final s in allSignedSums(left)) {
    leftCounts[s] = (leftCounts[s] ?? 0) + 1;
  }

  var ways = 0;
  for (final s in allSignedSums(right)) {
    ways += leftCounts[target - s] ?? 0;
  }
  return ways;
}
