from typing import List


class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        # Add the new interval, then sort everything by start time.
        combined = sorted(intervals + [newInterval], key=lambda iv: iv[0])

        # Merge neighbours that overlap, like the Merge Intervals problem.
        merged = []
        for start, end in combined:
            if merged and start <= merged[-1][1]:
                merged[-1][1] = max(merged[-1][1], end)
            else:
                merged.append([start, end])
        return merged
