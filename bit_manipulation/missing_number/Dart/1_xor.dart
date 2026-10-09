class Solution {
  int missingNumber(List<int> nums) {
    // XOR every index and every value: matching pairs cancel out,
    // leaving only the missing number.
    var missing = nums.length;
    for (var i = 0; i < nums.length; i++) {
      missing ^= i ^ nums[i];
    }
    return missing;
  }
}
