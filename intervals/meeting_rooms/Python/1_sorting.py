def can_attend_meetings(intervals: list[list[int]]) -> bool:
    # Sort by start time so any overlap must be between neighbors.
    ordered = sorted(intervals, key=lambda meeting: meeting[0])
    for i in range(1, len(ordered)):
        # The next meeting starts before the previous one ends.
        if ordered[i][0] < ordered[i - 1][1]:
            return False
    return True
