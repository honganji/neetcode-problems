fun canAttendMeetings(intervals: Array<IntArray>): Boolean {
    for (i in intervals.indices) {
        for (j in i + 1 until intervals.size) {
            val a = intervals[i]
            val b = intervals[j]
            // Two meetings overlap unless one ends before the other starts.
            if (a[0] < b[1] && b[0] < a[1]) return false
        }
    }
    return true
}
