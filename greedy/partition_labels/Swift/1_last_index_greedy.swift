class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let chars = Array(s.utf8)

        // Remember where each letter appears last.
        var last = [Int](repeating: 0, count: 26)
        for (i, c) in chars.enumerated() {
            last[Int(c) - 97] = i
        }

        var result: [Int] = []
        var start = 0 // where the current part begins
        var end = 0 // furthest last-occurrence seen in the current part
        for (i, c) in chars.enumerated() {
            end = max(end, last[Int(c) - 97])
            // Every letter seen so far ends inside this part, so cut here.
            if i == end {
                result.append(end - start + 1)
                start = i + 1
            }
        }
        return result
    }
}
