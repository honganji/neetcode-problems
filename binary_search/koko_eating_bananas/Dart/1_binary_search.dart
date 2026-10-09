int minEatingSpeed(List<int> piles, int h) {
  bool canFinish(int k) {
    var hours = 0;
    for (final pile in piles) {
      hours += (pile + k - 1) ~/ k;
      if (hours > h) return false;
    }
    return true;
  }

  var low = 1;
  var high = piles.reduce((a, b) => a > b ? a : b);
  while (low < high) {
    final mid = (low + high) ~/ 2;
    if (canFinish(mid)) {
      high = mid;
    } else {
      low = mid + 1;
    }
  }
  return low;
}
