double myPow(double x, int n) {
  var result = 1.0;
  // Multiply x by itself |n| times.
  for (var i = 0; i < n.abs(); i++) {
    result *= x;
  }
  return n < 0 ? 1 / result : result;
}
