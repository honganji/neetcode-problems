class Solution {
  bool canPartition(List<int> nums) {
    final total = nums.fold<int>(0, (sum, n) => sum + n);
    if (total.isOdd) return false;
    final target = total ~/ 2;

    // Bit s is 1 when some subset adds up to sum s.
    // At the start only sum 0 is reachable.
    var reachable = BigInt.one;
    for (final num in nums) {
      // Shifting left by num adds num to every reachable sum at once.
      reachable |= reachable << num;
    }

    return ((reachable >> target) & BigInt.one) == BigInt.one;
  }
}
