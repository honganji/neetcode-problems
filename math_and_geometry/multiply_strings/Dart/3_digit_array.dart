String multiply(String num1, String num2) {
  if (num1 == '0' || num2 == '0') return '0';

  final m = num1.length;
  final n = num2.length;
  // result[k] collects the products that land at place k, counted from the left.
  final result = List<int>.filled(m + n, 0);
  for (var i = m - 1; i >= 0; i--) {
    for (var j = n - 1; j >= 0; j--) {
      // Digit i of num1 times digit j of num2 lands at places i+j and i+j+1.
      final total = (num1.codeUnitAt(i) - 48) * (num2.codeUnitAt(j) - 48) +
          result[i + j + 1];
      result[i + j + 1] = total % 10;
      result[i + j] += total ~/ 10;
    }
  }

  var start = 0;
  while (start < result.length - 1 && result[start] == 0) {
    start++;
  }
  return result.sublist(start).map((d) => d.toString()).join();
}
