class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let n = intervals.count
        var i = 0

        // 1. Intervals that end before newInterval starts: keep as-is.
        while i < n && intervals[i][1] < newInterval[0] {
            result.append(intervals[i])
            i += 1
        }

        // 2. Intervals that overlap newInterval: absorb them into one bigger interval.
        var start = newInterval[0]
        var end = newInterval[1]
        while i < n && intervals[i][0] <= end {
            start = min(start, intervals[i][0])
            end = max(end, intervals[i][1])
            i += 1
        }
        result.append([start, end])

        // 3. Intervals that start after newInterval ends: keep as-is.
        result.append(contentsOf: intervals[i...])
        return result
    }
}
