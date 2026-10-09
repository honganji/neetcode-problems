func mergeIntervals(_ intervals: [[Int]]) -> [[Int]] {
    // Double every coordinate: point x is cell 2x, the gap (x, x+1) is cell 2x+1.
    // Then [1, 4] and [4, 5] touch (no gap cell), but [1, 4] and [5, 6] do not.
    let maxEnd = intervals.map { $0[1] }.max() ?? 0
    let limit = 2 * maxEnd + 2
    var diff = [Int](repeating: 0, count: limit + 1)
    for interval in intervals {
        diff[2 * interval[0]] += 1  // coverage begins at this cell
        diff[2 * interval[1] + 1] -= 1  // and stops right after this interval's last cell
    }

    var merged: [[Int]] = []
    var covered = 0  // how many intervals cover the current cell
    var openStart = -1  // first cell of the run we are inside, or -1
    for cell in 0..<limit {
        covered += diff[cell]
        if covered > 0 && openStart == -1 {
            openStart = cell
        } else if covered == 0 && openStart != -1 {
            merged.append([openStart / 2, (cell - 1) / 2])
            openStart = -1
        }
    }
    return merged
}
