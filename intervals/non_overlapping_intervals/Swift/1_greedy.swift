func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    guard !intervals.isEmpty else { return 0 }

    // Sort by end time so the interval that finishes earliest comes first.
    let sorted = intervals.sorted { $0[1] < $1[1] }

    var removed = 0
    var lastEnd = sorted[0][1]
    for interval in sorted.dropFirst() {
        if interval[0] < lastEnd {
            // Overlaps the interval we kept, so remove this one.
            removed += 1
        } else {
            // No overlap, keep it and move the boundary forward.
            lastEnd = interval[1]
        }
    }
    return removed
}
