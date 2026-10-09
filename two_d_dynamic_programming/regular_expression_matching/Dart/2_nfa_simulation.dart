class Solution {
  bool isMatch(String s, String p) {
    final n = p.length;

    // A "x*" token can be skipped entirely, so jump over it
    void closure(List<bool> active) {
      for (var j = 0; j < n; j++) {
        if (active[j] && j + 1 < n && p[j + 1] == '*') {
          active[j + 2] = true;
        }
      }
    }

    // State j = "next we must match p[j]"; state n = whole pattern consumed
    var cur = List<bool>.filled(n + 1, false);
    cur[0] = true;
    closure(cur);

    for (var i = 0; i < s.length; i++) {
      final c = s[i];
      final nxt = List<bool>.filled(n + 1, false);
      for (var j = 0; j < n; j++) {
        if (cur[j] && (p[j] == c || p[j] == '.')) {
          if (j + 1 < n && p[j + 1] == '*') {
            nxt[j] = true; // stay on "x*" to allow more matches
          } else {
            nxt[j + 1] = true;
          }
        }
      }
      closure(nxt);
      cur = nxt;
    }

    return cur[n];
  }
}
