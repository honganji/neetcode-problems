class Solution {
  bool canJump(List<int> nums) {
    // Leftmost index known to reach the last index (the last index is the goal)
    var lastGood = nums.length - 1;
    for (var i = nums.length - 2; i >= 0; i--) {
      // From i we can land on any index up to i + nums[i]
      if (i + nums[i] >= lastGood) lastGood = i;
    }
    return lastGood == 0;
  }
}
