class Solution {
  int hammingWeight(int n) {
    var count = 0;
    // n & (n - 1) clears the lowest set bit, so this loops once per 1 bit.
    while (n != 0) {
      n &= n - 1;
      count++;
    }
    return count;
  }
}
