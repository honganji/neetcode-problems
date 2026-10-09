class Solution {
  int reverseBits(int n) {
    // Swap neighbouring groups of bits, doubling the group size each step:
    // single bits, pairs, nibbles, bytes, then the two 16-bit halves.
    var bits = n;
    bits = ((bits >> 1) & 0x55555555) | ((bits & 0x55555555) << 1);
    bits = ((bits >> 2) & 0x33333333) | ((bits & 0x33333333) << 2);
    bits = ((bits >> 4) & 0x0F0F0F0F) | ((bits & 0x0F0F0F0F) << 4);
    bits = ((bits >> 8) & 0x00FF00FF) | ((bits & 0x00FF00FF) << 8);
    // Dart ints are 64-bit, so trim the result back to 32 bits.
    return ((bits >> 16) | (bits << 16)) & 0xFFFFFFFF;
  }
}
