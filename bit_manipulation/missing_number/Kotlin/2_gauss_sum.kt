class Solution {
    fun missingNumber(nums: IntArray): Int {
        // 0..n should add up to n(n+1)/2; the gap to the actual sum is the missing number.
        val n = nums.size
        return n * (n + 1) / 2 - nums.sum()
    }
}
