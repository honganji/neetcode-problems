def erase_overlap_intervals(intervals: list[list[int]]) -> int:
    if not intervals:
        return 0

    # Sort by end time so the interval that finishes earliest comes first.
    intervals.sort(key=lambda interval: interval[1])

    removed = 0
    last_end = intervals[0][1]
    for start, end in intervals[1:]:
        if start < last_end:
            # Overlaps the interval we kept, so remove this one.
            removed += 1
        else:
            # No overlap, keep it and move the boundary forward.
            last_end = end
    return removed
