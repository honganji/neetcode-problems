private class TrieNode {
    val children = HashMap<Char, TrieNode>()
    var word: String? = null
}

fun findWords(board: Array<CharArray>, words: Array<String>): List<String> {
    val root = TrieNode()
    for (word in words) {
        var node = root
        for (ch in word) {
            node = node.children.getOrPut(ch) { TrieNode() }
        }
        node.word = word
    }

    val rows = board.size
    val cols = board[0].size
    val found = HashSet<String>()

    fun dfs(r: Int, c: Int, parent: TrieNode) {
        val ch = board[r][c]
        val node = parent.children[ch] ?: return
        node.word?.let { found.add(it) }
        board[r][c] = '#'
        if (r + 1 < rows) dfs(r + 1, c, node)
        if (r > 0) dfs(r - 1, c, node)
        if (c + 1 < cols) dfs(r, c + 1, node)
        if (c > 0) dfs(r, c - 1, node)
        board[r][c] = ch
    }

    for (r in 0 until rows) {
        for (c in 0 until cols) {
            dfs(r, c, root)
        }
    }
    return found.toList()
}
