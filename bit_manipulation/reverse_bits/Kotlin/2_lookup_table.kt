// Precompute the reverse of every 8-bit value once.
// reversedByte[i] is i with its 8 bits flipped, e.g. 0b00000001 -> 0b10000000.
private val reversedByte = IntArray(256).also { table ->
    for (i in 1 until 256) {
        table[i] = (table[i shr 1] ushr 1) or ((i and 1) shl 7)
    }
}

class Solution {
    fun reverseBits(n: Int): Int {
        // Split the 32 bits into four bytes, reverse each one with the table,
        // and place it in the mirrored position.
        return (reversedByte[n and 0xFF] shl 24) or
            (reversedByte[(n ushr 8) and 0xFF] shl 16) or
            (reversedByte[(n ushr 16) and 0xFF] shl 8) or
            reversedByte[(n ushr 24) and 0xFF]
    }
}
