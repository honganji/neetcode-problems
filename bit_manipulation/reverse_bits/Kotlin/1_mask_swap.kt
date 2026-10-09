class Solution {
    fun reverseBits(n: Int): Int {
        // Swap neighbouring groups of bits, doubling the group size each step:
        // single bits, pairs, nibbles, bytes, then the two 16-bit halves.
        // ushr (unsigned shift) keeps the sign bit from being copied down.
        var bits = n
        bits = ((bits ushr 1) and 0x55555555) or ((bits and 0x55555555) shl 1)
        bits = ((bits ushr 2) and 0x33333333) or ((bits and 0x33333333) shl 2)
        bits = ((bits ushr 4) and 0x0F0F0F0F) or ((bits and 0x0F0F0F0F) shl 4)
        bits = ((bits ushr 8) and 0x00FF00FF) or ((bits and 0x00FF00FF) shl 8)
        return (bits ushr 16) or (bits shl 16)
    }
}
