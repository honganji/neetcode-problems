class Solution {
    fun canJump(nums: IntArray): Boolean {
        val n = nums.size
        // canReach[i] is true if the last index can be reached from index i
        val canReach = BooleanArray(n)
        canReach[n - 1] = true
        for (i in n - 2 downTo 0) {
            val furthest = minOf(i + nums[i], n - 1)
            for (j in i + 1..furthest) {
                if (canReach[j]) {
                    canReach[i] = true
                    break
                }
            }
        }
        return canReach[0]
    }
}
