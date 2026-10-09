class Solution {
  int missingNumber(List<int> nums) {
    final seen = nums.toSet();
    for (var i = 0; i <= nums.length; i++) {
      if (!seen.contains(i)) return i;
    }
    return -1; // unreachable: the constraints guarantee one number is missing
  }
}
