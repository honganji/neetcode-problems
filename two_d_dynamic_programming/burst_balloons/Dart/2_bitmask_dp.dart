class Solution {
  int maxCoins(List<int> nums) {
    final n = nums.length;
    // best[mask] = max coins from bursting exactly the balloons still set in mask.
    final best = List<int>.filled(1 << n, 0);

    for (var mask = 1; mask < (1 << n); mask++) {
      var total = 0;
      for (var i = 0; i < n; i++) {
        if (((mask >> i) & 1) == 0) continue;
        // Neighbors are the nearest balloons still alive on each side (or 1).
        var left = 1;
        for (var j = i - 1; j >= 0; j--) {
          if (((mask >> j) & 1) == 1) {
            left = nums[j];
            break;
          }
        }
        var right = 1;
        for (var j = i + 1; j < n; j++) {
          if (((mask >> j) & 1) == 1) {
            right = nums[j];
            break;
          }
        }
        // Burst i now, then solve the rest; the remaining mask is smaller, so already computed.
        final rest = mask ^ (1 << i);
        final candidate = left * nums[i] * right + best[rest];
        if (candidate > total) total = candidate;
      }
      best[mask] = total;
    }

    return best[(1 << n) - 1];
  }
}
