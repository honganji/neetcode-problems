const _keypad = {
  '2': 'abc', '3': 'def', '4': 'ghi', '5': 'jkl',
  '6': 'mno', '7': 'pqrs', '8': 'tuv', '9': 'wxyz',
};

List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return [];

  final options = [for (final d in digits.split('')) _keypad[d]!];
  var total = 1;
  for (final letters in options) {
    total *= letters.length;
  }

  final result = <String>[];
  for (var k = 0; k < total; k++) {
    // Decode k like a mixed-radix number: the last digit varies fastest.
    final chars = List<String>.filled(options.length, '');
    var rest = k;
    for (var j = options.length - 1; j >= 0; j--) {
      final letters = options[j];
      chars[j] = letters[rest % letters.length];
      rest ~/= letters.length;
    }
    result.add(chars.join());
  }
  return result;
}
