class Solution {
  int networkDelayTime(List<List<int>> times, int n, int k) {
    const inf = 1 << 30;
    final dist = List.generate(n + 1, (_) => List<int>.filled(n + 1, inf));
    for (var i = 1; i <= n; i++) {
      dist[i][i] = 0;
    }
    for (final t in times) {
      dist[t[0]][t[1]] = t[2] < dist[t[0]][t[1]] ? t[2] : dist[t[0]][t[1]];
    }

    // Allow nodes 1..mid as stepping stones, one at a time.
    for (var mid = 1; mid <= n; mid++) {
      for (var i = 1; i <= n; i++) {
        for (var j = 1; j <= n; j++) {
          final viaMid = dist[i][mid] + dist[mid][j];
          if (viaMid < dist[i][j]) dist[i][j] = viaMid;
        }
      }
    }

    final answer = dist[k].skip(1).reduce((a, b) => a > b ? a : b);
    return answer == inf ? -1 : answer;
  }
}
