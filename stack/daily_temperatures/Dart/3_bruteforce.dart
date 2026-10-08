List<int> dailyTemperatures(List<int> temperatures) {
  final n = temperatures.length;
  final answer = List<int>.filled(n, 0);
  for (var i = 0; i < n; i++) {
    for (var j = i + 1; j < n; j++) {
      if (temperatures[j] > temperatures[i]) {
        answer[i] = j - i;
        break;
      }
    }
  }
  return answer;
}
