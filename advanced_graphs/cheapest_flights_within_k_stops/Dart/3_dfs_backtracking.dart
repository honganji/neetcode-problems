class Solution {
  int findCheapestPrice(int n, List<List<int>> flights, int src, int dst, int k) {
    const unreachable = 1 << 60;
    final graph = List.generate(n, (_) => <List<int>>[]);
    for (final flight in flights) {
      graph[flight[0]].add([flight[1], flight[2]]);
    }

    var best = unreachable;

    void dfs(int city, int cost, int flightsLeft) {
      if (city == dst) {
        if (cost < best) best = cost;
        return;
      }
      if (flightsLeft == 0) return;

      for (final edge in graph[city]) {
        // Prices are never negative, so a path already too expensive can't get cheaper.
        if (cost + edge[1] < best) {
          dfs(edge[0], cost + edge[1], flightsLeft - 1);
        }
      }
    }

    dfs(src, 0, k + 1);
    return best == unreachable ? -1 : best;
  }
}
