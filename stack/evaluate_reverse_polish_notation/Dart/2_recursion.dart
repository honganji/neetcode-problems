int evalRPN(List<String> tokens) {
  var index = tokens.length - 1;

  int evaluate() {
    final token = tokens[index];
    index--;
    switch (token) {
      case '+':
        final b = evaluate();
        final a = evaluate();
        return a + b;
      case '-':
        final b = evaluate();
        final a = evaluate();
        return a - b;
      case '*':
        final b = evaluate();
        final a = evaluate();
        return a * b;
      case '/':
        final b = evaluate();
        final a = evaluate();
        return a ~/ b;
      default:
        return int.parse(token);
    }
  }

  return evaluate();
}
