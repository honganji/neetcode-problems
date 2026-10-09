class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s.utf8)
        let words = wordDict.map { Array($0.utf8) }

        // Try every word at the current position and recurse on the rest.
        // No memo, so the same suffix may be re-checked many times.
        func canSplit(_ start: Int) -> Bool {
            if start == chars.count { return true }
            for word in words {
                let end = start + word.count
                if end <= chars.count && chars[start..<end].elementsEqual(word) && canSplit(end) {
                    return true
                }
            }
            return false
        }

        return canSplit(0)
    }
}
