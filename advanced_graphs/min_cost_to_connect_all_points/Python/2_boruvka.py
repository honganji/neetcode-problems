from typing import List, Optional, Tuple


class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        n = len(points)
        parent = list(range(n))

        def find(x: int) -> int:
            while parent[x] != x:
                parent[x] = parent[parent[x]]  # path halving
                x = parent[x]
            return x

        def dist(i: int, j: int) -> int:
            return abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])

        total = 0
        components = n
        while components > 1:
            # Each component finds its cheapest edge to another component.
            # Tuples (cost, i, j) give a fixed tie-break order.
            best: List[Optional[Tuple[int, int, int]]] = [None] * n
            for i in range(n):
                ri = find(i)
                for j in range(i + 1, n):
                    rj = find(j)
                    if ri == rj:
                        continue
                    edge = (dist(i, j), i, j)
                    if best[ri] is None or edge < best[ri]:
                        best[ri] = edge
                    if best[rj] is None or edge < best[rj]:
                        best[rj] = edge

            # Add those edges, skipping any that would form a cycle.
            for edge in best:
                if edge is None:
                    continue
                cost, i, j = edge
                ri, rj = find(i), find(j)
                if ri != rj:
                    parent[ri] = rj
                    total += cost
                    components -= 1

        return total
