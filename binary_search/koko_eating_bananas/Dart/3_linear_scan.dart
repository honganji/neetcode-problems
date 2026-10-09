int minEatingSpeed(List<int> piles, int h) {
  var k = 1;
  while (true) {
    var hours = 0;
    for (final pile in piles) {
      hours += (pile + k - 1) ~/ k;
      if (hours > h) break;
    }
    if (hours <= h) return k;
    k++;
  }
}
