List<int> productExceptSelf(List<int> nums) {
  final n = nums.length;
  final result = List<int>.filled(n, 1);
  for (var i = 1; i < n; i++) {
    result[i] = result[i - 1] * nums[i - 1];
  }
  var suffix = 1;
  for (var i = n - 1; i >= 0; i--) {
    result[i] *= suffix;
    suffix *= nums[i];
  }
  return result;
}
