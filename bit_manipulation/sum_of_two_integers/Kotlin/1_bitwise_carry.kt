class Solution {
    fun getSum(a: Int, b: Int): Int {
        var x = a
        var y = b
        // XOR adds bits without carrying; AND shifted left is the carry.
        // Repeat until no carry is left. Int overflow wraps like 32-bit.
        while (y != 0) {
            val carry = (x and y) shl 1
            x = x xor y
            y = carry
        }
        return x
    }
}
