def erase_overlap_intervals(intervals: list[list[int]]) -> int:
    if not intervals:
        return 0

    # Sorting by end time means any interval that can come before interval i
    # in a chain has a smaller index.
    intervals.sort(key=lambda interval: interval[1])

    n = len(intervals)
    # best[i] = most intervals we can keep, ending with interval i.
    best = [1] * n
    for i in range(n):
        for j in range(i):
            if intervals[j][1] <= intervals[i][0]:
                best[i] = max(best[i], best[j] + 1)

    return n - max(best)
