func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    // Sort by start so the kept intervals are visited left to right.
    let sorted = intervals.sorted { $0[0] < $1[0] }

    // For each interval, either keep it (if it fits after the last kept one)
    // or skip it. Try both and return the most we can keep.
    func mostKept(_ i: Int, _ lastEnd: Int) -> Int {
        if i == sorted.count { return 0 }

        let skip = mostKept(i + 1, lastEnd)
        let start = sorted[i][0]
        let end = sorted[i][1]
        if start < lastEnd { return skip }

        return max(1 + mostKept(i + 1, end), skip)
    }

    // Int.min means "nothing kept yet", so any start fits.
    return intervals.count - mostKept(0, Int.min)
}
