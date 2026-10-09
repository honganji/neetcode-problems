import bisect


class KthLargest:
    def __init__(self, k: int, nums: list[int]):
        self.k = k
        # Sorted ascending, holding only the k largest values.
        self.top = sorted(nums)[-k:]

    def add(self, val: int) -> int:
        if len(self.top) < self.k:
            bisect.insort(self.top, val)
        elif val > self.top[0]:
            # Drop the smallest of the top k, then slot the new value in order.
            self.top.pop(0)
            bisect.insort(self.top, val)
        return self.top[0]
