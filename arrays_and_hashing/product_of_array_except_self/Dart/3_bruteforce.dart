List<int> productExceptSelf(List<int> nums) {
  final n = nums.length;
  final result = List<int>.filled(n, 1);
  for (var i = 0; i < n; i++) {
    var product = 1;
    for (var j = 0; j < n; j++) {
      if (j != i) {
        product *= nums[j];
      }
    }
    result[i] = product;
  }
  return result;
}
