int evalRPN(List<String> tokens) {
  final stack = <int>[];
  for (final token in tokens) {
    switch (token) {
      case '+':
        final b = stack.removeLast();
        final a = stack.removeLast();
        stack.add(a + b);
      case '-':
        final b = stack.removeLast();
        final a = stack.removeLast();
        stack.add(a - b);
      case '*':
        final b = stack.removeLast();
        final a = stack.removeLast();
        stack.add(a * b);
      case '/':
        final b = stack.removeLast();
        final a = stack.removeLast();
        stack.add(a ~/ b);
      default:
        stack.add(int.parse(token));
    }
  }
  return stack.last;
}
