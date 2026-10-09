from typing import List


class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        graph = [[] for _ in range(n)]
        for a, b in edges:
            graph[a].append(b)
            graph[b].append(a)

        visited = [False] * n
        components = 0
        for start in range(n):
            if visited[start]:
                continue
            # Every unvisited node starts a new component.
            components += 1
            visited[start] = True
            stack = [start]
            while stack:
                node = stack.pop()
                for neighbor in graph[node]:
                    if not visited[neighbor]:
                        visited[neighbor] = True
                        stack.append(neighbor)

        return components
