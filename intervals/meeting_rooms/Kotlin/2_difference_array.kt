fun canAttendMeetings(intervals: Array<IntArray>): Boolean {
    // Mark +1 where each meeting starts and -1 where it ends.
    val latest = intervals.maxOfOrNull { it[1] } ?: 0
    val changes = IntArray(latest + 1)
    for (meeting in intervals) {
        changes[meeting[0]]++
        changes[meeting[1]]--
    }

    // Walk the timeline; more than one meeting in progress means a clash.
    var inProgress = 0
    for (change in changes) {
        inProgress += change
        if (inProgress > 1) return false
    }
    return true
}
