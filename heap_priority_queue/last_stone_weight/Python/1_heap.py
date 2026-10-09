import heapq


def last_stone_weight(stones: list[int]) -> int:
    # heapq is a min-heap, so store negated weights to get the heaviest stone first
    heap = [-s for s in stones]
    heapq.heapify(heap)

    while len(heap) > 1:
        heaviest = -heapq.heappop(heap)
        second = -heapq.heappop(heap)
        if heaviest != second:
            heapq.heappush(heap, -(heaviest - second))

    return -heap[0] if heap else 0
