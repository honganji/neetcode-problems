class Solution {
    fun canJump(nums: IntArray): Boolean {
        // Leftmost index known to reach the last index (the last index is the goal)
        var lastGood = nums.lastIndex
        for (i in nums.lastIndex - 1 downTo 0) {
            // From i we can land on any index up to i + nums[i]
            if (i + nums[i] >= lastGood) lastGood = i
        }
        return lastGood == 0
    }
}
