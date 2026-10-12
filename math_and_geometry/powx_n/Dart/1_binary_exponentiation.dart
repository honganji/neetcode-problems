double myPow(double x, int n) {
  // A negative power is the reciprocal of the positive power.
  var base = n < 0 ? 1 / x : x;
  var remaining = n.abs();
  var result = 1.0;

  while (remaining > 0) {
    // If the lowest bit is set, this power of base is part of the answer.
    if (remaining.isOdd) result *= base;
    // Squaring base doubles the exponent it represents.
    base *= base;
    remaining ~/= 2;
  }
  return result;
}
