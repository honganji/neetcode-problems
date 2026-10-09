import heapq


class MedianFinder:
    def __init__(self):
        # max-heap (stored as negatives) holds the smaller half
        self.low = []
        # min-heap holds the larger half
        self.high = []

    def addNum(self, num: int) -> None:
        # push into low, then move low's largest into high
        heapq.heappush(self.high, -heapq.heappushpop(self.low, -num))
        # keep low the same size as high, or one bigger
        if len(self.high) > len(self.low):
            heapq.heappush(self.low, -heapq.heappop(self.high))

    def findMedian(self) -> float:
        if len(self.low) > len(self.high):
            return float(-self.low[0])
        return (-self.low[0] + self.high[0]) / 2
