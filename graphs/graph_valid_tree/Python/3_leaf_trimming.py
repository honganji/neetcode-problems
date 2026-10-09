from collections import deque
from typing import List


class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        if len(edges) != n - 1:
            return False

        adj = [[] for _ in range(n)]
        degree = [0] * n
        for a, b in edges:
            adj[a].append(b)
            adj[b].append(a)
            degree[a] += 1
            degree[b] += 1

        # Repeatedly strip leaves (degree <= 1). A tree gets fully stripped;
        # a cycle keeps its nodes at degree >= 2 forever.
        queue = deque(i for i in range(n) if degree[i] <= 1)
        removed = [False] * n
        removed_count = 0
        while queue:
            node = queue.popleft()
            removed[node] = True
            removed_count += 1
            for nei in adj[node]:
                if not removed[nei]:
                    degree[nei] -= 1
                    if degree[nei] == 1:
                        queue.append(nei)

        return removed_count == n
