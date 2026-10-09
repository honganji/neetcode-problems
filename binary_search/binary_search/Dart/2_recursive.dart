int search(List<int> nums, int target) {
  int helper(int low, int high) {
    if (low > high) {
      return -1;
    }
    final mid = low + (high - low) ~/ 2;
    if (nums[mid] == target) {
      return mid;
    }
    if (nums[mid] < target) {
      return helper(mid + 1, high);
    }
    return helper(low, mid - 1);
  }

  return helper(0, nums.length - 1);
}
