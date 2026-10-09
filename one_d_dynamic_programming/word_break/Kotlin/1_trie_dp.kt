class Solution {
    private class TrieNode {
        val children = HashMap<Char, TrieNode>()
        var isEnd = false
    }

    fun wordBreak(s: String, wordDict: List<String>): Boolean {
        // Store the dictionary in a trie so that from any position we can
        // walk forward and find every word that starts there in one pass.
        val root = TrieNode()
        for (word in wordDict) {
            var node = root
            for (ch in word) {
                node = node.children.getOrPut(ch) { TrieNode() }
            }
            node.isEnd = true
        }

        val n = s.length
        val canReach = BooleanArray(n + 1)  // canReach[i]: s[:i] can be split
        canReach[0] = true

        for (start in 0 until n) {
            if (!canReach[start]) continue
            var node = root
            for (end in start until n) {
                node = node.children[s[end]] ?: break
                if (node.isEnd) canReach[end + 1] = true
            }
        }

        return canReach[n]
    }
}
