def can_attend_meetings(intervals: list[list[int]]) -> bool:
    for i in range(len(intervals)):
        for j in range(i + 1, len(intervals)):
            a_start, a_end = intervals[i]
            b_start, b_end = intervals[j]
            # Two meetings overlap unless one ends before the other starts.
            if a_start < b_end and b_start < a_end:
                return False
    return True
