List<int> dailyTemperatures(List<int> temperatures) {
  final answer = List<int>.filled(temperatures.length, 0);
  final stack = <int>[];
  for (var i = 0; i < temperatures.length; i++) {
    while (stack.isNotEmpty && temperatures[stack.last] < temperatures[i]) {
      final j = stack.removeLast();
      answer[j] = i - j;
    }
    stack.add(i);
  }
  return answer;
}
