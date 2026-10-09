func mergeIntervals(_ intervals: [[Int]]) -> [[Int]] {
    var merged = intervals

    func overlaps(_ a: [Int], _ b: [Int]) -> Bool {
        return a[0] <= b[1] && b[0] <= a[1]
    }

    // returns the indices of the first overlapping pair, or nil if there is none
    func findOverlappingPair() -> (Int, Int)? {
        for i in 0..<merged.count {
            for j in (i + 1)..<merged.count where overlaps(merged[i], merged[j]) {
                return (i, j)
            }
        }
        return nil
    }

    // keep merging any overlapping pair until no two intervals overlap
    while let pair = findOverlappingPair() {
        let i = pair.0
        let j = pair.1
        merged[i] = [min(merged[i][0], merged[j][0]), max(merged[i][1], merged[j][1])]
        merged.remove(at: j)
    }

    return merged.sorted { $0[0] < $1[0] }
}
