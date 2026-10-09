class Solution {
    fun reverseBits(n: Int): Int {
        // Take bits off n from the lowest end and push each one onto the
        // bottom of the result. The first bit read ends up at the top.
        var bits = n
        var result = 0
        for (i in 0 until 32) {
            result = (result shl 1) or (bits and 1)
            bits = bits ushr 1
        }
        return result
    }
}
