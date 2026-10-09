class KthLargest:
    def __init__(self, k: int, nums: list[int]):
        self.k = k
        self.nums = list(nums)

    def add(self, val: int) -> int:
        self.nums.append(val)
        # Re-sort everything on every query and read off the kth largest.
        return sorted(self.nums, reverse=True)[self.k - 1]
