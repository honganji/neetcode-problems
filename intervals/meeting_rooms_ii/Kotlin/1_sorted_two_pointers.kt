fun minMeetingRooms(intervals: Array<IntArray>): Int {
    // Sort the start times and the end times separately, then walk through the starts in order.
    val starts = IntArray(intervals.size) { intervals[it][0] }.also { it.sort() }
    val ends = IntArray(intervals.size) { intervals[it][1] }.also { it.sort() }

    var rooms = 0
    var endPtr = 0
    for (start in starts) {
        if (start < ends[endPtr]) {
            // Every room is still busy at this start, so we need a new one.
            rooms++
        } else {
            // The earliest-ending meeting is over, so its room is free for reuse.
            endPtr++
        }
    }
    return rooms
}
