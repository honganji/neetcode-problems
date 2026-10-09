class Solution {
  int lengthOfLIS(List<int> nums) {
    // tails[k] = smallest value that can end an increasing subsequence of length k + 1.
    // This list stays sorted, so we can binary search it.
    final tails = <int>[];
    for (final x in nums) {
      // Find the first index where tails[i] >= x.
      var lo = 0;
      var hi = tails.length;
      while (lo < hi) {
        final mid = (lo + hi) ~/ 2;
        if (tails[mid] < x) {
          lo = mid + 1;
        } else {
          hi = mid;
        }
      }
      if (lo == tails.length) {
        tails.add(x); // x extends the longest subsequence so far
      } else {
        tails[lo] = x; // x makes a smaller tail for this length
      }
    }
    return tails.length;
  }
}
