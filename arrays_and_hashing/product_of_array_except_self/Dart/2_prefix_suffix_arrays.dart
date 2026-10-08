List<int> productExceptSelf(List<int> nums) {
  final n = nums.length;
  final prefix = List<int>.filled(n, 1);
  final suffix = List<int>.filled(n, 1);
  for (var i = 1; i < n; i++) {
    prefix[i] = prefix[i - 1] * nums[i - 1];
  }
  for (var i = n - 2; i >= 0; i--) {
    suffix[i] = suffix[i + 1] * nums[i + 1];
  }
  return List<int>.generate(n, (i) => prefix[i] * suffix[i]);
}
