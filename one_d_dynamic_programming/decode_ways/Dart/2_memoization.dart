class Solution {
  int numDecodings(String s) {
    final n = s.length;
    final memo = <int, int>{};

    // Number of ways to decode s[i:].
    int ways(int i) {
      if (i == n) return 1;
      if (s[i] == '0') return 0;
      final cached = memo[i];
      if (cached != null) return cached;

      // Decode one digit, then optionally decode two digits.
      var result = ways(i + 1);
      if (i + 1 < n) {
        final pair = (s.codeUnitAt(i) - 48) * 10 + (s.codeUnitAt(i + 1) - 48);
        if (pair >= 10 && pair <= 26) {
          result += ways(i + 2);
        }
      }

      memo[i] = result;
      return result;
    }

    return ways(0);
  }
}
