import heapq
from bisect import bisect_left


def minInterval(intervals: list[list[int]], queries: list[int]) -> list[int]:
    # Sweep the queries from smallest to largest. Intervals are added to a heap
    # once their left end is reached; the heap is ordered by size.
    by_left = sorted(intervals)
    order = sorted(range(len(queries)), key=lambda i: queries[i])
    answer = [-1] * len(queries)
    heap: list[tuple[int, int]] = []  # (size, right)
    next_interval = 0

    for qi in order:
        q = queries[qi]
        while next_interval < len(by_left) and by_left[next_interval][0] <= q:
            left, right = by_left[next_interval]
            heapq.heappush(heap, (right - left + 1, right))
            next_interval += 1
        # Queries only grow, so intervals that ended before q can never help again.
        while heap and heap[0][1] < q:
            heapq.heappop(heap)
        if heap:
            answer[qi] = heap[0][0]
    return answer
