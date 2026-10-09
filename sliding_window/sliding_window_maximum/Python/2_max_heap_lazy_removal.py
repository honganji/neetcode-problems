import heapq


def max_sliding_window(nums: list[int], k: int) -> list[int]:
    result = []
    heap = []
    for i, num in enumerate(nums):
        heapq.heappush(heap, (-num, i))
        if i >= k - 1:
            while heap[0][1] <= i - k:
                heapq.heappop(heap)
            result.append(-heap[0][0])
    return result
