from typing import List


class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        n = len(points)
        INF = 1 << 62
        # dist[v] = cheapest known link from point v to the tree built so far
        dist = [INF] * n
        in_tree = [False] * n
        dist[0] = 0
        total = 0

        for _ in range(n):
            # Pick the closest point that is not in the tree yet.
            u = -1
            for v in range(n):
                if not in_tree[v] and (u == -1 or dist[v] < dist[u]):
                    u = v
            in_tree[u] = True
            total += dist[u]

            # The new tree point may offer cheaper links to the rest.
            ux, uy = points[u]
            for v in range(n):
                if not in_tree[v]:
                    d = abs(ux - points[v][0]) + abs(uy - points[v][1])
                    if d < dist[v]:
                        dist[v] = d

        return total
