fun minMeetingRooms(intervals: Array<IntArray>): Int {
    var best = 0
    for (meeting in intervals) {
        val checkTime = meeting[0]
        // Count the meetings that are in progress at this start time.
        val busy = intervals.count { it[0] <= checkTime && checkTime < it[1] }
        best = maxOf(best, busy)
    }
    return best
}
