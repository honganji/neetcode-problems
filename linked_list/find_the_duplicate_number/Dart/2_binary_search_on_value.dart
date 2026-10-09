int findDuplicate(List<int> nums) {
  var low = 1;
  var high = nums.length - 1;
  while (low < high) {
    final mid = (low + high) ~/ 2;
    var count = 0;
    for (final num in nums) {
      if (num <= mid) {
        count++;
      }
    }
    if (count > mid) {
      high = mid;
    } else {
      low = mid + 1;
    }
  }
  return low;
}
