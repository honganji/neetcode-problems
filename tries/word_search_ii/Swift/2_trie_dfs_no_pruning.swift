func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    final class Node {
        var children: [Character: Node] = [:]
        var word: String?
    }

    let root = Node()
    for word in words {
        var node = root
        for ch in word {
            if let next = node.children[ch] {
                node = next
            } else {
                let next = Node()
                node.children[ch] = next
                node = next
            }
        }
        node.word = word
    }

    var board = board
    let rows = board.count
    let cols = board[0].count
    var found = Set<String>()

    func dfs(_ r: Int, _ c: Int, _ parent: Node) {
        let ch = board[r][c]
        guard let node = parent.children[ch] else { return }
        if let word = node.word {
            found.insert(word)
        }
        board[r][c] = "#"
        if r + 1 < rows { dfs(r + 1, c, node) }
        if r > 0 { dfs(r - 1, c, node) }
        if c + 1 < cols { dfs(r, c + 1, node) }
        if c > 0 { dfs(r, c - 1, node) }
        board[r][c] = ch
    }

    for r in 0..<rows {
        for c in 0..<cols {
            dfs(r, c, root)
        }
    }
    return Array(found)
}
