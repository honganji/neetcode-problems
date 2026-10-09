class Solution {
    fun maxProduct(nums: IntArray): Int {
        // Scan left-to-right and right-to-left, keeping running products.
        // A zero resets the running product, starting a fresh zero-free block.
        val n = nums.size
        var best = nums[0]
        var prefix = 1
        var suffix = 1
        for (i in 0 until n) {
            prefix *= nums[i]
            suffix *= nums[n - 1 - i]
            best = maxOf(best, prefix, suffix)
            if (prefix == 0) prefix = 1
            if (suffix == 0) suffix = 1
        }
        return best
    }
}
