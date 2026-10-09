class Solution {
    fun hammingWeight(n: Int): Int {
        var count = 0
        // Check each of the 32 bit positions.
        for (i in 0 until 32) {
            count += (n ushr i) and 1
        }
        return count
    }
}
