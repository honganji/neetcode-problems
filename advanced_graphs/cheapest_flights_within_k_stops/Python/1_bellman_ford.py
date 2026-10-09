from typing import List


class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        cost = [float("inf")] * n
        cost[src] = 0

        # k stops means at most k + 1 flights, so run k + 1 rounds.
        for _ in range(k + 1):
            # Read from the costs of the previous round so one round adds only one flight.
            previous = cost[:]
            for u, v, price in flights:
                if previous[u] + price < cost[v]:
                    cost[v] = previous[u] + price

        return -1 if cost[dst] == float("inf") else cost[dst]
