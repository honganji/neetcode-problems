int minEatingSpeed(List<int> piles, int h) {
  bool canFinish(int k) {
    var hours = 0;
    for (final pile in piles) {
      hours += (pile + k - 1) ~/ k;
      if (hours > h) return false;
    }
    return true;
  }

  var total = 0;
  var high = 0;
  for (final pile in piles) {
    total += pile;
    if (pile > high) high = pile;
  }
  var low = (total + h - 1) ~/ h;
  if (low < 1) low = 1;
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
