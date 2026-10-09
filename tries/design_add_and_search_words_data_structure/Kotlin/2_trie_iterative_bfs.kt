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
        val stack = ArrayDeque<Pair<Node, Int>>()
        stack.addLast(root to 0)
        while (stack.isNotEmpty()) {
            val (node, i) = stack.removeLast()
            if (i == word.length) {
                if (node.isWord) {
                    return true
                }
                continue
            }
            val ch = word[i]
            if (ch == '.') {
                for (child in node.children) {
                    if (child != null) {
                        stack.addLast(child to i + 1)
                    }
                }
            } else {
                val child = node.children[ch - 'a']
                if (child != null) {
                    stack.addLast(child to i + 1)
                }
            }
        }
        return false
    }
}
