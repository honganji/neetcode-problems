def can_attend_meetings(intervals: list[list[int]]) -> bool:
    # Mark +1 where each meeting starts and -1 where it ends.
    latest = max((end for _, end in intervals), default=0)
    changes = [0] * (latest + 1)
    for start, end in intervals:
        changes[start] += 1
        changes[end] -= 1

    # Walk the timeline; more than one meeting in progress means a clash.
    in_progress = 0
    for change in changes:
        in_progress += change
        if in_progress > 1:
            return False
    return True
