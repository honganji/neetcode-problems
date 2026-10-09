class Solution {
  int hammingWeight(int n) {
    // Count bits in 2-bit pairs, then 4-bit groups, then bytes, all at once.
    var x = n;
    x = x - ((x >> 1) & 0x55555555);
    x = (x & 0x33333333) + ((x >> 2) & 0x33333333);
    x = (x + (x >> 4)) & 0x0F0F0F0F;
    // Multiplying by 0x01010101 sums all four byte counts into the top byte.
    return ((x * 0x01010101) & 0xFFFFFFFF) >> 24;
  }
}
