class Solution {
  int hammingWeight(int n) {
    var count = 0;
    // Check each of the 32 bit positions.
    for (var i = 0; i < 32; i++) {
      count += (n >> i) & 1;
    }
    return count;
  }
}
