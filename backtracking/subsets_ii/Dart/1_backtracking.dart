List<List<int>> subsetsWithDup(List<int> nums) {
  final sorted = [...nums]..sort();
  final result = <List<int>>[];
  final path = <int>[];

  void backtrack(int start) {
    result.add([...path]);
    for (var i = start; i < sorted.length; i++) {
      // Equal values next to each other: only the first one may start a branch here.
      if (i > start && sorted[i] == sorted[i - 1]) continue;
      path.add(sorted[i]);
      backtrack(i + 1);
      path.removeLast();
    }
  }

  backtrack(0);
  return result;
}
