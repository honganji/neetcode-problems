class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let chars = Array(s)
        var result: [Int] = []
        var start = 0

        while start < chars.count {
            // Find the earliest end where no letter in the part appears later.
            var end = start
            while crossesCut(chars, start, end) {
                end += 1
            }
            result.append(end - start + 1)
            start = end + 1
        }
        return result
    }

    private func crossesCut(_ chars: [Character], _ start: Int, _ end: Int) -> Bool {
        let after = Set(chars[(end + 1)...])
        return chars[start...end].contains { after.contains($0) }
    }
}
