from typing import List


class Solution:
    def findItinerary(self, tickets: List[List[str]]) -> List[str]:
        best = None
        used = [False] * len(tickets)
        order = []

        def try_orders() -> None:
            nonlocal best
            if len(order) == len(tickets):
                # Check whether this order of tickets forms a valid trip.
                path = ["JFK"]
                for i in order:
                    src, dst = tickets[i]
                    if src != path[-1]:
                        return
                    path.append(dst)
                if best is None or path < best:  # lists compare lexicographically
                    best = path
                return
            for i in range(len(tickets)):
                if not used[i]:
                    used[i] = True
                    order.append(i)
                    try_orders()
                    order.pop()
                    used[i] = False

        try_orders()
        return best
