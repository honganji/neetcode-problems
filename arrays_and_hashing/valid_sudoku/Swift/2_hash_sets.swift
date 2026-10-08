func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows = [Set<Character>](repeating: [], count: 9)
    var cols = [Set<Character>](repeating: [], count: 9)
    var boxes = [Set<Character>](repeating: [], count: 9)
    for r in 0..<9 {
        for c in 0..<9 {
            let ch = board[r][c]
            if ch == "." { continue }
            let b = (r / 3) * 3 + c / 3
            if !rows[r].insert(ch).inserted || !cols[c].insert(ch).inserted
                || !boxes[b].insert(ch).inserted {
                return false
            }
        }
    }
    return true
}
