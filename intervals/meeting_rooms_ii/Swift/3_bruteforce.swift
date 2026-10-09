func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    var best = 0
    for meeting in intervals {
        let checkTime = meeting[0]
        // Count the meetings that are in progress at this start time.
        let busy = intervals.filter { $0[0] <= checkTime && checkTime < $0[1] }.count
        best = max(best, busy)
    }
    return best
}
