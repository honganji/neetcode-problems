from typing import List


class Solution:
    def validTree(self, n: int, edges: List[List[int]]) -> bool:
        if len(edges) != n - 1:
            return False

        adj = [[] for _ in range(n)]
        for a, b in edges:
            adj[a].append(b)
            adj[b].append(a)

        # Iterative DFS, so a long chain can't hit Python's recursion limit.
        visited = [False] * n
        stack = [(0, -1)]  # (node, parent it was reached from)
        while stack:
            node, parent = stack.pop()
            if visited[node]:
                return False  # reached twice, so there is a cycle
            visited[node] = True
            for nei in adj[node]:
                if nei != parent:
                    stack.append((nei, node))

        # Every node must be reachable from node 0.
        return all(visited)
