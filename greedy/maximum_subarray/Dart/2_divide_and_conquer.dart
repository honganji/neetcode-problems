import 'dart:math';

int maxSubArray(List<int> nums) {
  // Best subarray that lies entirely within nums[lo..hi].
  int solve(int lo, int hi) {
    if (lo == hi) {
      return nums[lo];
    }
    final mid = (lo + hi) ~/ 2;

    // Best subarray crossing the middle that ends at mid (on the left).
    var leftBest = nums[mid];
    var running = nums[mid];
    for (var i = mid - 1; i >= lo; i--) {
      running += nums[i];
      leftBest = max(leftBest, running);
    }

    // Best subarray crossing the middle that starts at mid + 1 (on the right).
    var rightBest = nums[mid + 1];
    running = nums[mid + 1];
    for (var i = mid + 2; i <= hi; i++) {
      running += nums[i];
      rightBest = max(rightBest, running);
    }

    return max(max(solve(lo, mid), solve(mid + 1, hi)), leftBest + rightBest);
  }

  return solve(0, nums.length - 1);
}
