class Solution {
    fun rob(nums: IntArray): Int {
        // best total for houses i onward, recomputed on every call
        fun tryFrom(i: Int): Int {
            if (i >= nums.size) return 0
            val skip = tryFrom(i + 1)
            val take = nums[i] + tryFrom(i + 2)
            return maxOf(skip, take)
        }
        return tryFrom(0)
    }
}
