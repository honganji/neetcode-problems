class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let words = Set(wordDict.map { Array($0.utf8) })
        let maxLen = wordDict.map { $0.utf8.count }.max() ?? 0

        let chars = Array(s.utf8)
        let n = chars.count
        var canReach = [Bool](repeating: false, count: n + 1)  // canReach[i]: s[:i] can be split
        canReach[0] = true

        for i in 1..<(n + 1) {
            // Only the last maxLen characters can form the final word.
            let lowest = max(0, i - maxLen)
            for j in stride(from: i - 1, through: lowest, by: -1) {
                if canReach[j] && words.contains(Array(chars[j..<i])) {
                    canReach[i] = true
                    break
                }
            }
        }

        return canReach[n]
    }
}
