import heapq


def find_kth_largest(nums: list[int], k: int) -> int:
    # Min-heap that keeps only the k largest values seen so far.
    # Its smallest item (the root) is the kth largest overall.
    heap: list[int] = []
    for num in nums:
        heapq.heappush(heap, num)
        if len(heap) > k:
            heapq.heappop(heap)  # drop the smallest, it is not in the top k
    return heap[0]
