List<List<int>> subsetsWithDup(List<int> nums) {
  final counts = <int, int>{};
  for (final n in nums) {
    counts[n] = (counts[n] ?? 0) + 1;
  }

  // For each distinct value, a subset takes 0, 1, ..., count copies of it.
  var result = <List<int>>[[]];
  for (final value in counts.keys.toList()..sort()) {
    final next = <List<int>>[];
    for (final subset in result) {
      for (var k = 0; k <= counts[value]!; k++) {
        next.add([...subset, ...List.filled(k, value)]);
      }
    }
    result = next;
  }
  return result;
}
