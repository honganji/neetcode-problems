import heapq


def minMeetingRooms(intervals: list[list[int]]) -> int:
    # Heap of end times for the rooms in use; the earliest end is always on top.
    ends: list[int] = []
    for start, end in sorted(intervals):
        if ends and ends[0] <= start:
            # The room that frees up first is free now, so reuse it.
            heapq.heapreplace(ends, end)
        else:
            heapq.heappush(ends, end)
    return len(ends)
