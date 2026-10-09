import 'dart:collection';

List<int> maxSlidingWindow(List<int> nums, int k) {
  final result = <int>[];
  final window = ListQueue<int>();
  for (var i = 0; i < nums.length; i++) {
    while (window.isNotEmpty && nums[window.last] <= nums[i]) {
      window.removeLast();
    }
    window.addLast(i);
    if (window.first <= i - k) {
      window.removeFirst();
    }
    if (i >= k - 1) {
      result.add(nums[window.first]);
    }
  }
  return result;
}
