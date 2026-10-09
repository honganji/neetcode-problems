class Solution {
    fun hammingWeight(n: Int): Int {
        // Count bits in 2-bit pairs, then 4-bit groups, then bytes, all at once.
        // ushr (unsigned shift) keeps this correct when n is negative (top bit set).
        var x = n
        x = x - ((x ushr 1) and 0x55555555)
        x = (x and 0x33333333) + ((x ushr 2) and 0x33333333)
        x = (x + (x ushr 4)) and 0x0F0F0F0F
        // Multiplying by 0x01010101 sums the four byte counts into the top byte.
        return (x * 0x01010101) ushr 24
    }
}
