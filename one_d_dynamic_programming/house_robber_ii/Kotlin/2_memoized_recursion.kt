class Solution {
    fun rob(nums: IntArray): Int {
        val n = nums.size
        val memo = HashMap<Triple<Int, Boolean, Boolean>, Int>()

        // Best money from house i onward.
        // prevRobbed: was house i-1 robbed? (can't rob two in a row)
        // firstRobbed: was house 0 robbed? (house n-1 is its neighbour)
        fun dfs(i: Int, prevRobbed: Boolean, firstRobbed: Boolean): Int {
            if (i == n) return 0
            val key = Triple(i, prevRobbed, firstRobbed)
            memo[key]?.let { return it }

            var best = dfs(i + 1, false, firstRobbed) // skip house i
            val blockedByFirst = i == n - 1 && firstRobbed
            if (!prevRobbed && !blockedByFirst) {
                best = maxOf(best, nums[i] + dfs(i + 1, true, firstRobbed))
            }

            memo[key] = best
            return best
        }

        // Decide house 0 up front, then let the recursion handle the rest.
        return maxOf(dfs(1, false, false), nums[0] + dfs(1, true, true))
    }
}
