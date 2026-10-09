const _keypad = {
  '2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
  '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz',
};

List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return [];

  final result = <String>[];
  final path = <String>[];

  void backtrack(int i) {
    if (i == digits.length) {
      result.add(path.join());
      return;
    }
    for (final ch in _keypad[digits[i]]!.split('')) {
      path.add(ch);
      backtrack(i + 1);
      path.removeLast();
    }
  }

  backtrack(0);
  return result;
}
