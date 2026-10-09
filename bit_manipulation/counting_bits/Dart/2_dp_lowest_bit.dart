List<int> countBits(int n) {
  final ans = List<int>.filled(n + 1, 0);
  for (var i = 1; i <= n; i++) {
    // i & (i - 1) clears the lowest set bit, leaving one fewer 1-bit.
    ans[i] = ans[i & (i - 1)] + 1;
  }
  return ans;
}
