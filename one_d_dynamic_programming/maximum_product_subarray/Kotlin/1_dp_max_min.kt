class Solution {
    fun maxProduct(nums: IntArray): Int {
        // A negative number can turn the smallest product so far into the largest,
        // so track both the max and min product of subarrays ending at each index.
        var curMax = nums[0]
        var curMin = nums[0]
        var best = nums[0]
        for (i in 1 until nums.size) {
            val x = nums[i]
            val a = curMax * x
            val b = curMin * x
            curMax = maxOf(x, a, b)
            curMin = minOf(x, a, b)
            best = maxOf(best, curMax)
        }
        return best
    }
}
