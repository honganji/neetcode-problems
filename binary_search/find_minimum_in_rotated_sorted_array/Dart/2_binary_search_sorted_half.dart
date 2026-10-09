import 'dart:math';

int findMin(List<int> nums) {
  var left = 0;
  var right = nums.length - 1;
  var result = nums[0];
  while (left <= right) {
    if (nums[left] <= nums[right]) {
      result = min(result, nums[left]);
      break;
    }
    final mid = (left + right) ~/ 2;
    result = min(result, nums[mid]);
    if (nums[mid] >= nums[left]) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return result;
}
