List<int> countBits(int n) {
  final ans = List<int>.filled(n + 1, 0);
  for (var i = 1; i <= n; i++) {
    // i >> 1 drops the last bit; i & 1 is that last bit.
    ans[i] = ans[i >> 1] + (i & 1);
  }
  return ans;
}
