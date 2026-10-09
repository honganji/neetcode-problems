class Solution:
    def networkDelayTime(self, times: list[list[int]], n: int, k: int) -> int:
        INF = float("inf")
        dist = [[INF] * (n + 1) for _ in range(n + 1)]
        for i in range(1, n + 1):
            dist[i][i] = 0
        for u, v, w in times:
            dist[u][v] = min(dist[u][v], w)

        # Allow nodes 1..mid as stepping stones, one at a time.
        for mid in range(1, n + 1):
            for i in range(1, n + 1):
                for j in range(1, n + 1):
                    dist[i][j] = min(dist[i][j], dist[i][mid] + dist[mid][j])

        answer = max(dist[k][1:])
        return -1 if answer == INF else answer
