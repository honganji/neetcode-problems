import heapq
from collections import Counter, deque
from typing import List


class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        # heapq is a min-heap, so store negated counts to get a max-heap
        max_heap = [-c for c in Counter(tasks).values()]
        heapq.heapify(max_heap)
        cooldown = deque()  # (negated remaining count, time it is ready again)

        time = 0
        while max_heap or cooldown:
            time += 1
            # A task that finished its cooldown goes back into the heap
            if cooldown and cooldown[0][1] == time:
                heapq.heappush(max_heap, cooldown.popleft()[0])
            if max_heap:
                neg_count = heapq.heappop(max_heap) + 1  # run one copy
                if neg_count < 0:
                    cooldown.append((neg_count, time + n + 1))
            # If the heap is empty, this slot is idle
        return time
