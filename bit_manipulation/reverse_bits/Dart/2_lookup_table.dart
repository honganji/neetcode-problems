// Precompute the reverse of every 8-bit value once.
// _reversedByte[i] is i with its 8 bits flipped, e.g. 0b00000001 -> 0b10000000.
final List<int> _reversedByte = _buildReversedByteTable();

List<int> _buildReversedByteTable() {
  final table = List<int>.filled(256, 0);
  for (var i = 1; i < 256; i++) {
    table[i] = (table[i >> 1] >> 1) | ((i & 1) << 7);
  }
  return table;
}

class Solution {
  int reverseBits(int n) {
    // Split the 32 bits into four bytes, reverse each one with the table,
    // and place it in the mirrored position.
    return (_reversedByte[n & 0xFF] << 24) |
        (_reversedByte[(n >> 8) & 0xFF] << 16) |
        (_reversedByte[(n >> 16) & 0xFF] << 8) |
        _reversedByte[(n >> 24) & 0xFF];
  }
}
