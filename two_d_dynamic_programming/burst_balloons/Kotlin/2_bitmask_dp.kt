class Solution {
    fun maxCoins(nums: IntArray): Int {
        val n = nums.size
        // best[mask] = max coins from bursting exactly the balloons still set in mask.
        val best = IntArray(1 shl n)

        for (mask in 1 until (1 shl n)) {
            var total = 0
            for (i in 0 until n) {
                if (((mask shr i) and 1) == 0) continue
                // Neighbors are the nearest balloons still alive on each side (or 1).
                var left = 1
                for (j in i - 1 downTo 0) {
                    if (((mask shr j) and 1) == 1) {
                        left = nums[j]
                        break
                    }
                }
                var right = 1
                for (j in i + 1 until n) {
                    if (((mask shr j) and 1) == 1) {
                        right = nums[j]
                        break
                    }
                }
                // Burst i now, then solve the rest; the remaining mask is smaller, so already computed.
                val rest = mask xor (1 shl i)
                total = maxOf(total, left * nums[i] * right + best[rest])
            }
            best[mask] = total
        }

        return best[(1 shl n) - 1]
    }
}
