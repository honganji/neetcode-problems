final class TrieNode {
    var children: [UInt8: TrieNode] = [:]
    var isEnd = false
}

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        // Store the dictionary in a trie so that from any position we can
        // walk forward and find every word that starts there in one pass.
        let root = TrieNode()
        for word in wordDict {
            var node = root
            for byte in word.utf8 {
                if let next = node.children[byte] {
                    node = next
                } else {
                    let next = TrieNode()
                    node.children[byte] = next
                    node = next
                }
            }
            node.isEnd = true
        }

        let chars = Array(s.utf8)
        let n = chars.count
        var canReach = [Bool](repeating: false, count: n + 1)  // canReach[i]: s[:i] can be split
        canReach[0] = true

        for start in 0..<n {
            if !canReach[start] { continue }
            var node = root
            for end in start..<n {
                guard let next = node.children[chars[end]] else { break }
                node = next
                if node.isEnd { canReach[end + 1] = true }
            }
        }

        return canReach[n]
    }
}
