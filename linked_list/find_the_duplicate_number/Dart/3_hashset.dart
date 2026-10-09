int findDuplicate(List<int> nums) {
  final seen = <int>{};
  for (final num in nums) {
    if (!seen.add(num)) {
      return num;
    }
  }
  return -1;
}
