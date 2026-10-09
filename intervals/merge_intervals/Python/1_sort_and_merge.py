def merge_intervals(intervals: list[list[int]]) -> list[list[int]]:
    if not intervals:
        return []
    intervals.sort(key=lambda iv: iv[0])  # sorting by start puts overlaps next to each other
    merged = [intervals[0][:]]  # copy so the input's inner lists are not changed
    for start, end in intervals[1:]:
        if start <= merged[-1][1]:  # overlaps or touches the last merged interval
            merged[-1][1] = max(merged[-1][1], end)
        else:
            merged.append([start, end])
    return merged
