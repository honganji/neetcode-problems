import heapq


def k_closest(points: list[list[int]], k: int) -> list[list[int]]:
    # heapq is a min-heap, so store negative distances to keep the farthest on top.
    heap: list[tuple[int, list[int]]] = []
    for p in points:
        d = p[0] * p[0] + p[1] * p[1]
        heapq.heappush(heap, (-d, p))
        # Drop the farthest point once we hold more than k.
        if len(heap) > k:
            heapq.heappop(heap)
    return [p for _, p in heap]
