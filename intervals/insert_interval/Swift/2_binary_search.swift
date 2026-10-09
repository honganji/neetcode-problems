class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var start = newInterval[0]
        var end = newInterval[1]

        // The intervals that overlap newInterval form one contiguous block,
        // intervals[lo..<hi]. Two binary searches find its edges.
        // lo: first interval that ends at or after newInterval starts.
        let lo = binarySearchFirst(intervals) { $0[1] >= start }
        // hi: first interval that starts after newInterval ends.
        let hi = binarySearchFirst(intervals) { $0[0] > end }

        // Merge the overlapping block (if any) into newInterval.
        if lo < hi {
            start = min(start, intervals[lo][0])
            end = max(end, intervals[hi - 1][1])
        }

        var result = Array(intervals[..<lo])
        result.append([start, end])
        result.append(contentsOf: intervals[hi...])
        return result
    }

    // Binary search. Works because the test is false for a prefix and true after it.
    private func binarySearchFirst(_ intervals: [[Int]], _ test: ([Int]) -> Bool) -> Int {
        var lo = 0
        var hi = intervals.count
        while lo < hi {
            let mid = (lo + hi) / 2
            if test(intervals[mid]) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}
