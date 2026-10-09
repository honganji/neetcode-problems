import heapq
from collections import defaultdict


class Solution:
    def networkDelayTime(self, times: list[list[int]], n: int, k: int) -> int:
        graph = defaultdict(list)
        for u, v, w in times:
            graph[u].append((v, w))

        dist = [float("inf")] * (n + 1)
        dist[k] = 0
        heap = [(0, k)]  # (time the signal reaches node, node)

        while heap:
            d, u = heapq.heappop(heap)
            if d > dist[u]:  # stale entry, a faster route was already found
                continue
            for v, w in graph[u]:
                if d + w < dist[v]:
                    dist[v] = d + w
                    heapq.heappush(heap, (dist[v], v))

        answer = max(dist[1:])
        return -1 if answer == float("inf") else answer
