fun canAttendMeetings(intervals: Array<IntArray>): Boolean {
    // Sort by start time so any overlap must be between neighbors.
    val ordered = intervals.sortedBy { it[0] }
    for (i in 1 until ordered.size) {
        // The next meeting starts before the previous one ends.
        if (ordered[i][0] < ordered[i - 1][1]) return false
    }
    return true
}
