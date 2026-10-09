const _keypad = {
  '2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
  '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz',
};

List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return [];

  var combos = <String>[''];
  for (final d in digits.split('')) {
    final next = <String>[];
    for (final prefix in combos) {
      for (final ch in _keypad[d]!.split('')) {
        next.add(prefix + ch);
      }
    }
    combos = next;
  }
  return combos;
}
