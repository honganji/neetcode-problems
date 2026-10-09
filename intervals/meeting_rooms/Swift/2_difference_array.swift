func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    // Mark +1 where each meeting starts and -1 where it ends.
    let latest = intervals.map { $0[1] }.max() ?? 0
    var changes = [Int](repeating: 0, count: latest + 1)
    for meeting in intervals {
        changes[meeting[0]] += 1
        changes[meeting[1]] -= 1
    }

    // Walk the timeline; more than one meeting in progress means a clash.
    var inProgress = 0
    for change in changes {
        inProgress += change
        if inProgress > 1 { return false }
    }
    return true
}
