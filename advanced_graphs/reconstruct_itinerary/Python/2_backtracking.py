from collections import defaultdict
from typing import List


class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        graph = defaultdict(list)
        for src, dst in tickets:
            graph[src].append(dst)
        for destinations in graph.values():
            destinations.sort()  # smallest first

        route = ["JFK"]
        total = len(tickets) + 1

        def dfs(current: str) -> bool:
            if len(route) == total:
                return True
            destinations = graph[current]
            for i in range(len(destinations)):
                nxt = destinations.pop(i)  # use this ticket
                route.append(nxt)
                if dfs(nxt):
                    return True
                route.pop()  # undo and try the next option
                destinations.insert(i, nxt)
            return False

        dfs("JFK")
        return route
