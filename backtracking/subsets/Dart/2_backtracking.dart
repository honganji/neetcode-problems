List<List<int>> subsets(List<int> nums) {
  final result = <List<int>>[];
  final path = <int>[];

  void backtrack(int start) {
    result.add(List.of(path));
    for (var i = start; i < nums.length; i++) {
      path.add(nums[i]);
      backtrack(i + 1);
      path.removeLast();
    }
  }

  backtrack(0);
  return result;
}
