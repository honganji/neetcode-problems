class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    // Try every word at the current position and recurse on the rest.
    // No memo, so the same suffix may be re-checked many times.
    bool canSplit(int start) {
      if (start == s.length) return true;
      for (final word in wordDict) {
        if (s.startsWith(word, start) && canSplit(start + word.length)) {
          return true;
        }
      }
      return false;
    }

    return canSplit(0);
  }
}
