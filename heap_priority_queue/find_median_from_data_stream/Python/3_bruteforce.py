class MedianFinder:
    def __init__(self):
        self.nums = []

    def addNum(self, num: int) -> None:
        self.nums.append(num)

    def findMedian(self) -> float:
        ordered = sorted(self.nums)
        n = len(ordered)
        mid = n // 2
        if n % 2 == 1:
            return float(ordered[mid])
        return (ordered[mid - 1] + ordered[mid]) / 2
