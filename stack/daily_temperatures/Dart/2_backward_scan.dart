List<int> dailyTemperatures(List<int> temperatures) {
  final n = temperatures.length;
  final answer = List<int>.filled(n, 0);
  for (var i = n - 2; i >= 0; i--) {
    var j = i + 1;
    while (temperatures[j] <= temperatures[i]) {
      if (answer[j] == 0) {
        j = -1;
        break;
      }
      j += answer[j];
    }
    if (j != -1) {
      answer[i] = j - i;
    }
  }
  return answer;
}
