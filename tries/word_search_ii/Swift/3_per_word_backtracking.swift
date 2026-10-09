func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    var board = board
    let rows = board.count
    let cols = board[0].count

    func exists(_ r: Int, _ c: Int, _ word: [Character], _ i: Int) -> Bool {
        if board[r][c] != word[i] { return false }
        if i == word.count - 1 { return true }
        board[r][c] = "#"
        let ok = (r + 1 < rows && exists(r + 1, c, word, i + 1))
            || (r > 0 && exists(r - 1, c, word, i + 1))
            || (c + 1 < cols && exists(r, c + 1, word, i + 1))
            || (c > 0 && exists(r, c - 1, word, i + 1))
        board[r][c] = word[i]
        return ok
    }

    var found: [String] = []
    for word in Set(words) {
        let chars = Array(word)
        if chars.count > rows * cols { continue }
        var hit = false
        for r in 0..<rows where !hit {
            for c in 0..<cols where !hit {
                hit = exists(r, c, chars, 0)
            }
        }
        if hit { found.append(word) }
    }
    return found
}
