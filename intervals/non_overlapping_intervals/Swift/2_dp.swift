func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    guard !intervals.isEmpty else { return 0 }

    // Sorting by end time means any interval that can come before interval i
    // in a chain has a smaller index.
    let sorted = intervals.sorted { $0[1] < $1[1] }

    let n = sorted.count
    // best[i] = most intervals we can keep, ending with interval i.
    var best = Array(repeating: 1, count: n)
    for i in 0..<n {
        for j in 0..<i where sorted[j][1] <= sorted[i][0] {
            best[i] = max(best[i], best[j] + 1)
        }
    }

    return n - (best.max() ?? 0)
}
