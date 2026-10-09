import bisect


class MedianFinder:
    def __init__(self):
        self.nums = []  # kept sorted at all times

    def addNum(self, num: int) -> None:
        # binary search finds the spot, insort shifts the later items over
        bisect.insort(self.nums, num)

    def findMedian(self) -> float:
        n = len(self.nums)
        mid = n // 2
        if n % 2 == 1:
            return float(self.nums[mid])
        return (self.nums[mid - 1] + self.nums[mid]) / 2
