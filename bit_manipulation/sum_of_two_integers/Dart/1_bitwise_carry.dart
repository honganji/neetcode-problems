class Solution {
  int getSum(int a, int b) {
    // XOR adds bits without carrying; AND shifted left is the carry.
    // Repeat until no carry is left.
    while (b != 0) {
      final carry = (a & b) << 1;
      a = a ^ b;
      b = carry;
    }
    return a;
  }
}
