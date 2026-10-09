func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    for i in intervals.indices {
        for j in (i + 1)..<intervals.count {
            let a = intervals[i]
            let b = intervals[j]
            // Two meetings overlap unless one ends before the other starts.
            if a[0] < b[1] && b[0] < a[1] { return false }
        }
    }
    return true
}
