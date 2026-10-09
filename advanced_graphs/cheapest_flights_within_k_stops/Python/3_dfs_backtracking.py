from collections import defaultdict
from typing import List


class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        graph = defaultdict(list)
        for u, v, price in flights:
            graph[u].append((v, price))

        best = [float("inf")]

        def dfs(city: int, cost: int, flights_left: int) -> None:
            if city == dst:
                best[0] = min(best[0], cost)
                return
            if flights_left == 0:
                return

            for nxt, price in graph[city]:
                # Prices are never negative, so a path already too expensive can't get cheaper.
                if cost + price < best[0]:
                    dfs(nxt, cost + price, flights_left - 1)

        dfs(src, 0, k + 1)
        return -1 if best[0] == float("inf") else best[0]
