class Solution {
  List<List<String>> partition(String s) {
    final n = s.length;
    // isPal[i][j] is true when s[i..j] is a palindrome.
    final isPal = List.generate(n, (_) => List<bool>.filled(n, false));
    for (var i = n - 1; i >= 0; i--) {
      for (var j = i; j < n; j++) {
        isPal[i][j] = s[i] == s[j] && (j - i < 2 || isPal[i + 1][j - 1]);
      }
    }

    final result = <List<String>>[];
    final current = <String>[];

    void backtrack(int start) {
      if (start == n) {
        result.add(List<String>.from(current));
        return;
      }
      for (var end = start; end < n; end++) {
        if (isPal[start][end]) {
          current.add(s.substring(start, end + 1));
          backtrack(end + 1);
          current.removeLast();
        }
      }
    }

    backtrack(0);
    return result;
  }
}
