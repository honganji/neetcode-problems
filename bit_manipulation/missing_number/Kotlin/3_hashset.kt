class Solution {
    fun missingNumber(nums: IntArray): Int {
        val seen = nums.toHashSet()
        for (i in 0..nums.size) {
            if (i !in seen) return i
        }
        return -1 // unreachable: the constraints guarantee one number is missing
    }
}
