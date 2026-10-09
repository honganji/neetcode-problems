bool checkValidString(String s) {
  final n = s.length;
  // valid[i][j] is true if s.substring(i, j) can be made into a valid string.
  final valid = List.generate(n + 1, (_) => List.filled(n + 1, false));
  for (var i = 0; i <= n; i++) {
    valid[i][i] = true; // the empty string is valid
  }

  for (var length = 1; length <= n; length++) {
    for (var i = 0; i + length <= n; i++) {
      final j = i + length;
      if (s[i] == '*' && valid[i + 1][j]) {
        // This '*' is an empty string.
        valid[i][j] = true;
      } else if (s[i] != ')') {
        // s[i] opens a pair that is closed by some s[k].
        for (var k = i + 1; k < j; k++) {
          if (s[k] != '(' && valid[i + 1][k] && valid[k + 1][j]) {
            valid[i][j] = true;
            break;
          }
        }
      }
    }
  }
  return valid[0][n];
}
