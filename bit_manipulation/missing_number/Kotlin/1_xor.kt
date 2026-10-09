class Solution {
    fun missingNumber(nums: IntArray): Int {
        // XOR every index and every value: matching pairs cancel out,
        // leaving only the missing number.
        var missing = nums.size
        for (i in nums.indices) {
            missing = missing xor i xor nums[i]
        }
        return missing
    }
}
