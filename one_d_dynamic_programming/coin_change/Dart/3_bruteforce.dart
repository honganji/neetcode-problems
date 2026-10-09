int coinChange(List<int> coins, int amount) {
  int fewest(int remaining) {
    if (remaining == 0) return 0;
    var best = -1;
    for (final c in coins) {
      if (c > remaining) continue;
      final sub = fewest(remaining - c);
      if (sub != -1 && (best == -1 || sub + 1 < best)) best = sub + 1;
    }
    return best;
  }

  return fewest(amount);
}
