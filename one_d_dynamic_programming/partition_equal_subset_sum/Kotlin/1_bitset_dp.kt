import java.math.BigInteger

class Solution {
    fun canPartition(nums: IntArray): Boolean {
        val total = nums.sum()
        if (total % 2 != 0) return false
        val target = total / 2

        // Bit s is 1 when some subset adds up to sum s.
        // At the start only sum 0 is reachable.
        var reachable = BigInteger.ONE
        for (num in nums) {
            // Shifting left by num adds num to every reachable sum at once.
            reachable = reachable.or(reachable.shiftLeft(num))
        }

        return reachable.testBit(target)
    }
}
