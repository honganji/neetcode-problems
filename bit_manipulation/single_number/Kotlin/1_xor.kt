class Solution {
    fun singleNumber(nums: IntArray): Int {
        var result = 0
        for (n in nums) {
            result = result xor n // pairs cancel out: a xor a == 0
        }
        return result
    }
}
