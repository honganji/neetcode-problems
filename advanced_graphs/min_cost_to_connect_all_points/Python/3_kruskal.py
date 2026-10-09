from typing import List


class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        n = len(points)

        # Every pair of points is a possible edge: (cost, i, j).
        edges = []
        for i in range(n):
            for j in range(i + 1, n):
                cost = abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])
                edges.append((cost, i, j))
        edges.sort()

        parent = list(range(n))

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]  # path halving
                x = parent[x]
            return x

        total = 0
        used = 0
        # Take the cheapest edges that do not close a loop, until n - 1 are taken.
        for cost, i, j in edges:
            if used == n - 1:
                break
            ri, rj = find(i), find(j)
            if ri != rj:
                parent[ri] = rj
                total += cost
                used += 1

        return total
