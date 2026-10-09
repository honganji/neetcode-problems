from collections import deque
from typing import List


class Solution:
    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:
        n = len(edges)
        adj = [[] for _ in range(n + 1)]
        degree = [0] * (n + 1)
        for a, b in edges:
            adj[a].append(b)
            adj[b].append(a)
            degree[a] += 1
            degree[b] += 1

        # Repeatedly strip leaves (degree 1). Only the cycle nodes keep degree >= 2.
        queue = deque(i for i in range(1, n + 1) if degree[i] == 1)
        while queue:
            node = queue.popleft()
            for nxt in adj[node]:
                degree[nxt] -= 1
                if degree[nxt] == 1:
                    queue.append(nxt)

        # Edges between two cycle nodes are cycle edges; take the last one.
        for a, b in reversed(edges):
            if degree[a] >= 2 and degree[b] >= 2:
                return [a, b]

        return []
