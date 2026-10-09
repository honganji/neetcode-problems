class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let chars = Array(s.utf8)

        // First and last index of each letter (-1 means the letter is absent).
        var first = [Int](repeating: -1, count: 26)
        var last = [Int](repeating: -1, count: 26)
        for (i, c) in chars.enumerated() {
            let k = Int(c) - 97
            if first[k] == -1 { first[k] = i }
            last[k] = i
        }

        // Each letter covers an interval; sort them by start.
        let intervals = (0..<26)
            .filter { first[$0] != -1 }
            .map { (start: first[$0], end: last[$0]) }
            .sorted { $0.start < $1.start }

        // Merge overlapping intervals; each merged block is one part.
        var result: [Int] = []
        var start = intervals[0].start
        var end = intervals[0].end
        for iv in intervals.dropFirst() {
            if iv.start > end {
                result.append(end - start + 1)
                start = iv.start
                end = iv.end
            } else {
                end = max(end, iv.end)
            }
        }
        result.append(end - start + 1)
        return result
    }
}
