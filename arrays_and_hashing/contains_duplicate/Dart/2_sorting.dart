bool containsDuplicate(List<int> nums) {
  final sorted = List<int>.from(nums)..sort();
  for (var i = 1; i < sorted.length; i++) {
    if (sorted[i] == sorted[i - 1]) {
      return true;
    }
  }
  return false;
}
