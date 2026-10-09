int search(List<int> nums, int target) {
  final n = nums.length;
  var left = 0;
  var right = n - 1;
  while (left < right) {
    final mid = (left + right) ~/ 2;
    if (nums[mid] > nums[right]) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  final pivot = left;

  if (pivot == 0 || !(nums[0] <= target && target <= nums[pivot - 1])) {
    left = pivot;
    right = n - 1;
  } else {
    left = 0;
    right = pivot - 1;
  }

  while (left <= right) {
    final mid = (left + right) ~/ 2;
    if (nums[mid] == target) {
      return mid;
    }
    if (nums[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}
