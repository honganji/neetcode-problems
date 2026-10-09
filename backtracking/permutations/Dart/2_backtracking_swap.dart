List<List<int>> permute(List<int> nums) {
  final arr = [...nums];
  final result = <List<int>>[];

  void backtrack(int start) {
    // Everything before `start` is fixed; try each remaining value at `start`
    if (start == arr.length) {
      result.add([...arr]);
      return;
    }
    for (var i = start; i < arr.length; i++) {
      _swap(arr, start, i); // choose
      backtrack(start + 1); // explore
      _swap(arr, start, i); // undo
    }
  }

  backtrack(0);
  return result;
}

void _swap(List<int> list, int i, int j) {
  final tmp = list[i];
  list[i] = list[j];
  list[j] = tmp;
}
