class Solution {
    fun maxProduct(nums: IntArray): Int {
        // Try every subarray by fixing a start and extending the end.
        var best = nums[0]
        for (i in nums.indices) {
            var product = 1
            for (j in i until nums.size) {
                product *= nums[j]
                best = maxOf(best, product)
            }
        }
        return best
    }
}
