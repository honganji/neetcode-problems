int evalRPN(List<String> tokens) {
  const operators = {'+', '-', '*', '/'};
  final list = List<String>.from(tokens);
  while (list.length > 1) {
    var i = 0;
    while (!operators.contains(list[i])) {
      i++;
    }
    final a = int.parse(list[i - 2]);
    final b = int.parse(list[i - 1]);
    final int result;
    switch (list[i]) {
      case '+':
        result = a + b;
      case '-':
        result = a - b;
      case '*':
        result = a * b;
      default:
        result = a ~/ b;
    }
    list.replaceRange(i - 2, i + 1, [result.toString()]);
  }
  return int.parse(list[0]);
}
