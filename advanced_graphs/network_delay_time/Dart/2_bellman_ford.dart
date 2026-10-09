class Solution {
  int networkDelayTime(List<List<int>> times, int n, int k) {
    const inf = 1 << 30;
    final dist = List<int>.filled(n + 1, inf);
    dist[k] = 0;

    // A shortest path uses at most n - 1 edges, so n - 1 passes are enough.
    for (var pass = 0; pass < n - 1; pass++) {
      var changed = false;
      for (final t in times) {
        final u = t[0];
        final v = t[1];
        final w = t[2];
        if (dist[u] + w < dist[v]) {
          dist[v] = dist[u] + w;
          changed = true;
        }
      }
      if (!changed) break; // nothing left to improve
    }

    final answer = dist.skip(1).reduce((a, b) => a > b ? a : b);
    return answer == inf ? -1 : answer;
  }
}
