class Solution {
    fun canJump(nums: IntArray): Boolean {
        // Farthest index we can reach so far
        var farthest = 0
        for (i in nums.indices) {
            // Index i is past every reachable index, so it can never be reached
            if (i > farthest) return false
            farthest = maxOf(farthest, i + nums[i])
        }
        return true
    }
}
