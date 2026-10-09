from typing import List


class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        # Each letter covers an interval from its first to its last occurrence.
        first = {}
        last = {}
        for i, c in enumerate(s):
            first.setdefault(c, i)
            last[c] = i

        intervals = sorted((first[c], last[c]) for c in first)

        # Merge overlapping intervals; each merged block is one part.
        result = []
        start, end = intervals[0]
        for lo, hi in intervals[1:]:
            if lo > end:
                result.append(end - start + 1)
                start, end = lo, hi
            else:
                end = max(end, hi)
        result.append(end - start + 1)

        return result
