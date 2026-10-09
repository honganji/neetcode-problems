def minMeetingRooms(intervals: list[list[int]]) -> int:
    # Sort the start times and the end times separately, then walk through the starts in order.
    starts = sorted(start for start, _ in intervals)
    ends = sorted(end for _, end in intervals)

    rooms = 0
    end_ptr = 0
    for start in starts:
        if start < ends[end_ptr]:
            # Every room is still busy at this start, so we need a new one.
            rooms += 1
        else:
            # The earliest-ending meeting is over, so its room is free for reuse.
            end_ptr += 1
    return rooms
