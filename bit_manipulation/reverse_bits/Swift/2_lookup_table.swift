// Precompute the reverse of every 8-bit value once.
// reversedByte[i] is i with its 8 bits flipped, e.g. 0b00000001 -> 0b10000000.
private let reversedByte: [Int] = {
    var table = [Int](repeating: 0, count: 256)
    for i in 1..<256 {
        table[i] = (table[i >> 1] >> 1) | ((i & 1) << 7)
    }
    return table
}()

class Solution {
    func reverseBits(_ n: Int) -> Int {
        // Split the 32 bits into four bytes, reverse each one with the table,
        // and place it in the mirrored position.
        return (reversedByte[n & 0xFF] << 24) |
            (reversedByte[(n >> 8) & 0xFF] << 16) |
            (reversedByte[(n >> 16) & 0xFF] << 8) |
            reversedByte[(n >> 24) & 0xFF]
    }
}
