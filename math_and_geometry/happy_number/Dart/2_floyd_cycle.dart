bool isHappy(int n) {
  // Treat the chain of numbers like a linked list. slow moves one step, fast moves two.
  // A happy chain ends at the fixed point 1; an unhappy chain loops, so fast catches slow.
  var slow = n;
  var fast = _digitSquareSum(n);
  while (fast != 1 && slow != fast) {
    slow = _digitSquareSum(slow);
    fast = _digitSquareSum(_digitSquareSum(fast));
  }
  return fast == 1;
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
