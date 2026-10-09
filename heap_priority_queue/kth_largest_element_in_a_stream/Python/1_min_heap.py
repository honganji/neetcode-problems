import heapq


class KthLargest:
    def __init__(self, k: int, nums: list[int]):
        self.k = k
        # Min-heap that only ever holds the k largest values seen so far.
        # Its root is the smallest of those, which is the kth largest overall.
        self.heap = list(nums)
        heapq.heapify(self.heap)
        while len(self.heap) > k:
            heapq.heappop(self.heap)

    def add(self, val: int) -> int:
        if len(self.heap) < self.k:
            heapq.heappush(self.heap, val)
        elif val > self.heap[0]:
            # Replace the smallest of the top k with the new, larger value.
            heapq.heapreplace(self.heap, val)
        return self.heap[0]
