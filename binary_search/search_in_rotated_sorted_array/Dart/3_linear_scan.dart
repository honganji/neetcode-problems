int search(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) {
      return i;
    }
  }
  return -1;
}
