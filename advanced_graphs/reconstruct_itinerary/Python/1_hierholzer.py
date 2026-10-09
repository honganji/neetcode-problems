from collections import defaultdict
from typing import List


class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        # Destinations sorted in reverse, so pop() gives the smallest one.
        graph = defaultdict(list)
        for src, dst in tickets:
            graph[src].append(dst)
        for destinations in graph.values():
            destinations.sort(reverse=True)

        stack = ["JFK"]
        route = []
        while stack:
            if graph[stack[-1]]:
                stack.append(graph[stack[-1]].pop())  # take the smallest unused ticket
            else:
                route.append(stack.pop())  # stuck: this airport goes at the end
        return route[::-1]
