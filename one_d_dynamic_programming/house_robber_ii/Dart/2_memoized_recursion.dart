import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    final n = nums.length;
    final memo = <int, int>{};

    // Best money from house i onward.
    // prevRobbed: was house i-1 robbed? (can't rob two in a row)
    // firstRobbed: was house 0 robbed? (house n-1 is its neighbour)
    int dfs(int i, bool prevRobbed, bool firstRobbed) {
      if (i == n) return 0;
      // Pack the three values into one int as a memo key.
      final key = i * 4 + (prevRobbed ? 2 : 0) + (firstRobbed ? 1 : 0);
      final cached = memo[key];
      if (cached != null) return cached;

      var best = dfs(i + 1, false, firstRobbed); // skip house i
      final blockedByFirst = i == n - 1 && firstRobbed;
      if (!prevRobbed && !blockedByFirst) {
        best = max(best, nums[i] + dfs(i + 1, true, firstRobbed));
      }

      memo[key] = best;
      return best;
    }

    // Decide house 0 up front, then let the recursion handle the rest.
    return max(dfs(1, false, false), nums[0] + dfs(1, true, true));
  }
}
