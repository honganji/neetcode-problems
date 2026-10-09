class Solution {
  int climbStairs(int n) {
    // [[1, 1], [1, 0]] raised to the n-th power holds Fibonacci numbers.
    var result = [
      [1, 0],
      [0, 1],
    ]; // identity matrix
    var base = [
      [1, 1],
      [1, 0],
    ];
    while (n > 0) {
      if (n.isOdd) result = _multiply(result, base);
      base = _multiply(base, base); // square: M^1, M^2, M^4, ...
      n ~/= 2;
    }
    return result[0][0];
  }

  List<List<int>> _multiply(List<List<int>> a, List<List<int>> b) {
    return [
      [
        a[0][0] * b[0][0] + a[0][1] * b[1][0],
        a[0][0] * b[0][1] + a[0][1] * b[1][1],
      ],
      [
        a[1][0] * b[0][0] + a[1][1] * b[1][0],
        a[1][0] * b[0][1] + a[1][1] * b[1][1],
      ],
    ];
  }
}
