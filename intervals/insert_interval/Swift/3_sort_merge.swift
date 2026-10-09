class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        // Add the new interval, then sort everything by start time.
        let combined = (intervals + [newInterval]).sorted { $0[0] < $1[0] }

        // Merge neighbours that overlap, like the Merge Intervals problem.
        var merged: [[Int]] = []
        for interval in combined {
            if let last = merged.last, interval[0] <= last[1] {
                merged[merged.count - 1][1] = max(last[1], interval[1])
            } else {
                merged.append(interval)
            }
        }
        return merged
    }
}
