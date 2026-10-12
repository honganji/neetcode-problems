import 'dart:math';

double myPow(double x, int n) {
  if (n == 0) return 1.0;
  if (x == 0) return n > 0 ? 0.0 : double.infinity;

  // x^n = e^(n * ln|x|), so the power becomes one multiply and one exp.
  final magnitude = exp(n * log(x.abs()));
  // An odd power of a negative number stays negative.
  final negative = x < 0 && n.isOdd;
  return negative ? -magnitude : magnitude;
}
