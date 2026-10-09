import 'dart:math';

class Solution {
  int findCheapestPrice(int n, List<List<int>> flights, int src, int dst, int k) {
    const unreachable = 1 << 60;
    final cost = List<int>.filled(n, unreachable);
    cost[src] = 0;

    // k stops means at most k + 1 flights, so run k + 1 rounds.
    for (var round = 0; round <= k; round++) {
      // Read from the costs of the previous round so one round adds only one flight.
      final previous = List<int>.of(cost);
      for (final flight in flights) {
        final from = flight[0], to = flight[1], price = flight[2];
        if (previous[from] == unreachable) continue;
        cost[to] = min(cost[to], previous[from] + price);
      }
    }

    return cost[dst] == unreachable ? -1 : cost[dst];
  }
}
