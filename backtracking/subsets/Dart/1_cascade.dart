List<List<int>> subsets(List<int> nums) {
  final result = <List<int>>[[]];
  for (final num in nums) {
    // Each existing subset gets a copy with num added to it.
    final copies = [for (final subset in result) [...subset, num]];
    result.addAll(copies);
  }
  return result;
}
