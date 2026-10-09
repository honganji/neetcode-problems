class Solution {
  int numDecodings(String s) {
    final n = s.length;

    // Try every possible split of s[i:] into 1-digit and 2-digit pieces.
    int ways(int i) {
      if (i == n) return 1;
      if (s[i] == '0') return 0;

      var total = ways(i + 1);
      if (i + 1 < n) {
        final pair = (s.codeUnitAt(i) - 48) * 10 + (s.codeUnitAt(i + 1) - 48);
        if (pair >= 10 && pair <= 26) {
          total += ways(i + 2);
        }
      }
      return total;
    }

    return ways(0);
  }
}
