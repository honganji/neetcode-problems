bool containsDuplicate(List<int> nums) {
  final seen = <int>{};
  for (final num in nums) {
    if (!seen.add(num)) {
      return true;
    }
  }
  return false;
}
