class Solution {
    fun rob(nums: IntArray): Int {
        val n = nums.size
        if (n == 1) return nums[0]

        var best = 0
        // Each bit of mask says whether that house is robbed (2^n possible sets).
        for (mask in 0 until (1 shl n)) {
            var legal = true
            var total = 0
            for (i in 0 until n) {
                val robbed = ((mask shr i) and 1) == 1
                val nextRobbed = ((mask shr ((i + 1) % n)) and 1) == 1
                // Two neighbours on the circle can't both be robbed.
                if (robbed && nextRobbed) {
                    legal = false
                    break
                }
                if (robbed) total += nums[i]
            }
            if (legal) best = maxOf(best, total)
        }
        return best
    }
}
