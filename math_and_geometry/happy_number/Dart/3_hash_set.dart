bool isHappy(int n) {
  // If we ever repeat a number, the chain is looping and can never reach 1.
  final seen = <int>{};
  var current = n;
  while (current != 1) {
    if (seen.contains(current)) return false;
    seen.add(current);
    current = _digitSquareSum(current);
  }
  return true;
}

int _digitSquareSum(int n) {
  var total = 0;
  var rest = n;
  while (rest > 0) {
    final digit = rest % 10;
    total += digit * digit;
    rest ~/= 10;
  }
  return total;
}
