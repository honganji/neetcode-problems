class WordDictionary() {
    private class Node {
        val children = arrayOfNulls<Node>(26)
        var isWord = false
    }

    private val root = Node()

    fun addWord(word: String) {
        var node = root
        for (ch in word) {
            val idx = ch - 'a'
            if (node.children[idx] == null) {
                node.children[idx] = Node()
            }
            node = node.children[idx]!!
        }
        node.isWord = true
    }

    fun search(word: String): Boolean {
        return dfs(root, word, 0)
    }

    private fun dfs(node: Node, word: String, i: Int): Boolean {
        if (i == word.length) {
            return node.isWord
        }
        val ch = word[i]
        if (ch == '.') {
            return node.children.any { it != null && dfs(it, word, i + 1) }
        }
        val child = node.children[ch - 'a'] ?: return false
        return dfs(child, word, i + 1)
    }
}
