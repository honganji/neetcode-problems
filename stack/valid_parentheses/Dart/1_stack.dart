bool isValid(String s) {
  const pairs = {')': '(', ']': '[', '}': '{'};
  final stack = <String>[];
  for (var i = 0; i < s.length; i++) {
    final ch = s[i];
    if (pairs.containsKey(ch)) {
      if (stack.isEmpty || stack.removeLast() != pairs[ch]) {
        return false;
      }
    } else {
      stack.add(ch);
    }
  }
  return stack.isEmpty;
}
