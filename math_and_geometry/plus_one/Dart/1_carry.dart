List<int> plusOne(List<int> digits) {
  // Walk from the least significant digit and stop at the first digit that can absorb the carry.
  for (var i = digits.length - 1; i >= 0; i--) {
    if (digits[i] < 9) {
      digits[i]++;
      return digits;
    }
    // A 9 becomes 0 and passes the carry to the digit on its left.
    digits[i] = 0;
  }
  // Every digit was 9, so the result gains a leading 1.
  return [1, ...digits];
}
