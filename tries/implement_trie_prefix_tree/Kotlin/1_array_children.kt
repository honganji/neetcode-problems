class Trie() {
    private class Node {
        val children = arrayOfNulls<Node>(26)
        var isEnd = false
    }

    private val root = Node()

    fun insert(word: String) {
        var node = root
        for (ch in word) {
            val index = ch - 'a'
            node = node.children[index] ?: Node().also { node.children[index] = it }
        }
        node.isEnd = true
    }

    fun search(word: String): Boolean {
        return find(word)?.isEnd == true
    }

    fun startsWith(prefix: String): Boolean {
        return find(prefix) != null
    }

    private fun find(key: String): Node? {
        var node = root
        for (ch in key) {
            node = node.children[ch - 'a'] ?: return null
        }
        return node
    }
}
