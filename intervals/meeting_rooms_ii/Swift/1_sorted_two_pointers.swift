func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    // Sort the start times and the end times separately, then walk through the starts in order.
    let starts = intervals.map { $0[0] }.sorted()
    let ends = intervals.map { $0[1] }.sorted()

    var rooms = 0
    var endPtr = 0
    for start in starts {
        if start < ends[endPtr] {
            // Every room is still busy at this start, so we need a new one.
            rooms += 1
        } else {
            // The earliest-ending meeting is over, so its room is free for reuse.
            endPtr += 1
        }
    }
    return rooms
}
