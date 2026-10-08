List<String> generateParenthesis(int n) {
  bool isValid(String s) {
    var balance = 0;
    for (var i = 0; i < s.length; i++) {
      balance += s[i] == '(' ? 1 : -1;
      if (balance < 0) {
        return false;
      }
    }
    return balance == 0;
  }

  final result = <String>[];
  final total = 2 * n;
  for (var mask = 0; mask < (1 << total); mask++) {
    final buffer = StringBuffer();
    for (var i = 0; i < total; i++) {
      buffer.write((mask >> i) & 1 == 1 ? '(' : ')');
    }
    final candidate = buffer.toString();
    if (isValid(candidate)) {
      result.add(candidate);
    }
  }
  return result;
}
