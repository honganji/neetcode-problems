def minMeetingRooms(intervals: list[list[int]]) -> int:
    best = 0
    for check_time, _ in intervals:
        # Count the meetings that are in progress at this start time.
        busy = sum(1 for start, end in intervals if start <= check_time < end)
        best = max(best, busy)
    return best
