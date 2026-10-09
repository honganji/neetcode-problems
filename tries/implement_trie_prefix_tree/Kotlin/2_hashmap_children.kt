class Trie() {
    private class Node {
        val children = HashMap<Char, Node>()
        var isEnd = false
    }

    private val root = Node()

    fun insert(word: String) {
        var node = root
        for (ch in word) {
            node = node.children.getOrPut(ch) { Node() }
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
            node = node.children[ch] ?: return null
        }
        return node
    }
}
