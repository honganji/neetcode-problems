func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    // Sort by start time so any overlap must be between neighbors.
    let ordered = intervals.sorted { $0[0] < $1[0] }
    for i in ordered.indices.dropFirst() {
        // The next meeting starts before the previous one ends.
        if ordered[i][0] < ordered[i - 1][1] { return false }
    }
    return true
}
