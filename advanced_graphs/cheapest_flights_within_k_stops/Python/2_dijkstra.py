import heapq
from collections import defaultdict
from typing import List


class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        graph = defaultdict(list)
        for u, v, price in flights:
            graph[u].append((v, price))

        # Heap entries: (cost so far, city, flights used so far), cheapest first.
        heap = [(0, src, 0)]
        # Track flights used too, so a cheap route with too many stops
        # does not hide a slightly pricier route that is allowed.
        best = {(src, 0): 0}

        while heap:
            cost, city, used = heapq.heappop(heap)
            if city == dst:
                return cost
            if used == k + 1:
                continue

            for nxt, price in graph[city]:
                new_cost = cost + price
                state = (nxt, used + 1)
                if new_cost < best.get(state, float("inf")):
                    best[state] = new_cost
                    heapq.heappush(heap, (new_cost, nxt, used + 1))

        return -1
