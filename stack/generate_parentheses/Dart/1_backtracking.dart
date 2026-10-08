List<String> generateParenthesis(int n) {
  final result = <String>[];
  final current = <String>[];

  void backtrack(int openCount, int closeCount) {
    if (current.length == 2 * n) {
      result.add(current.join());
      return;
    }
    if (openCount < n) {
      current.add('(');
      backtrack(openCount + 1, closeCount);
      current.removeLast();
    }
    if (closeCount < openCount) {
      current.add(')');
      backtrack(openCount, closeCount + 1);
      current.removeLast();
    }
  }

  backtrack(0, 0);
  return result;
}
