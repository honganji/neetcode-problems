class Solution {
  int getSum(int a, int b) {
    var result = a;
    // The loop only counts |b| steps; each step does the work with bits.
    for (var i = 0; i < b.abs(); i++) {
      result = b > 0 ? _increment(result) : _decrement(result);
    }
    return result;
  }

  // Turn the trailing 1s into 0s until we reach a 0, then set that 0 to 1.
  int _increment(int x) {
    var value = x;
    var bit = 1;
    while ((value & bit) != 0) {
      value ^= bit;
      bit <<= 1;
    }
    return value ^ bit;
  }

  // x - 1 == ~(~x + 1), and ~ is just a bit flip.
  int _decrement(int x) => ~_increment(~x);
}
