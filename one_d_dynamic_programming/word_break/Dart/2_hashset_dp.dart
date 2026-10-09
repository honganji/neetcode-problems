import 'dart:math';

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    final words = wordDict.toSet();
    final maxLen = wordDict.map((w) => w.length).reduce(max);

    final n = s.length;
    final canReach = List<bool>.filled(n + 1, false); // canReach[i]: s[:i] can be split
    canReach[0] = true;

    for (var i = 1; i <= n; i++) {
      // Only the last maxLen characters can form the final word.
      final lowest = max(0, i - maxLen);
      for (var j = i - 1; j >= lowest; j--) {
        if (canReach[j] && words.contains(s.substring(j, i))) {
          canReach[i] = true;
          break;
        }
      }
    }

    return canReach[n];
  }
}
