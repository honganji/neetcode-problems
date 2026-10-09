class Solution {
    fun canPartition(nums: IntArray): Boolean {
        val total = nums.sum()
        if (total % 2 != 0) return false

        fun dfs(i: Int, remaining: Int): Boolean {
            // Found a subset with the exact target sum.
            if (remaining == 0) return true
            // Ran out of numbers, or overshot the target.
            if (i == nums.size || remaining < 0) return false
            // Try taking nums[i], or skipping it.
            return dfs(i + 1, remaining - nums[i]) || dfs(i + 1, remaining)
        }

        return dfs(0, total / 2)
    }
}
