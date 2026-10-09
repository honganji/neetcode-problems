from typing import Callable, List


class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        start, end = newInterval

        # The intervals that overlap newInterval form one contiguous block,
        # intervals[lo:hi]. Two binary searches find its edges.
        # lo: first interval that ends at or after newInterval starts.
        lo = self._first_index(intervals, lambda iv: iv[1] >= start)
        # hi: first interval that starts after newInterval ends.
        hi = self._first_index(intervals, lambda iv: iv[0] > end)

        # Merge the overlapping block (if any) into newInterval.
        if lo < hi:
            start = min(start, intervals[lo][0])
            end = max(end, intervals[hi - 1][1])

        return intervals[:lo] + [[start, end]] + intervals[hi:]

    def _first_index(self, intervals: List[List[int]], pred: Callable[[List[int]], bool]) -> int:
        # Binary search. Works because pred is False for a prefix and True after it.
        lo, hi = 0, len(intervals)
        while lo < hi:
            mid = (lo + hi) // 2
            if pred(intervals[mid]):
                hi = mid
            else:
                lo = mid + 1
        return lo
