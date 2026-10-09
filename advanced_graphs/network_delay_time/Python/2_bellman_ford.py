class Solution:
    def networkDelayTime(self, times: list[list[int]], n: int, k: int) -> int:
        dist = [float("inf")] * (n + 1)
        dist[k] = 0

        # A shortest path uses at most n - 1 edges, and each pass
        # over all edges makes one more hop correct.
        for _ in range(n - 1):
            changed = False
            for u, v, w in times:
                if dist[u] + w < dist[v]:
                    dist[v] = dist[u] + w
                    changed = True
            if not changed:  # nothing left to improve
                break

        answer = max(dist[1:])
        return -1 if answer == float("inf") else answer
