from typing import List


class Solution:
    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:
        n = len(edges)
        adj = [[] for _ in range(n + 1)]

        def connected(src: int, dst: int) -> bool:
            seen = [False] * (n + 1)
            seen[src] = True
            stack = [src]
            while stack:
                node = stack.pop()
                if node == dst:
                    return True
                for nxt in adj[node]:
                    if not seen[nxt]:
                        seen[nxt] = True
                        stack.append(nxt)
            return False

        for a, b in edges:
            if connected(a, b):  # already linked by earlier edges, so this one makes a loop
                return [a, b]
            adj[a].append(b)
            adj[b].append(a)

        return []
