List<int> countBits(int n) {
  final ans = List<int>.filled(n + 1, 0);
  for (var i = 0; i <= n; i++) {
    var x = i;
    while (x != 0) {
      x &= x - 1; // clear the lowest set bit
      ans[i]++;
    }
  }
  return ans;
}
