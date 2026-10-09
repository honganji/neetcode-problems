def erase_overlap_intervals(intervals: list[list[int]]) -> int:
    # Sort by start so the kept intervals are visited left to right.
    intervals.sort(key=lambda interval: interval[0])

    def most_kept(i: int, last_end: float) -> int:
        # For each interval, either keep it (if it fits after the last kept one)
        # or skip it. Try both and return the most we can keep.
        if i == len(intervals):
            return 0

        skip = most_kept(i + 1, last_end)
        start, end = intervals[i]
        if start < last_end:
            return skip

        take = 1 + most_kept(i + 1, end)
        return max(take, skip)

    return len(intervals) - most_kept(0, float("-inf"))
