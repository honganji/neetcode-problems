func isValidSudoku(_ board: [[Character]]) -> Bool {
    func hasDuplicate(_ cells: [Character]) -> Bool {
        var seen = Set<Character>()
        for ch in cells {
            if ch == "." { continue }
            if !seen.insert(ch).inserted { return true }
        }
        return false
    }

    for r in 0..<9 {
        if hasDuplicate(board[r]) { return false }
    }
    for c in 0..<9 {
        if hasDuplicate((0..<9).map { board[$0][c] }) { return false }
    }
    for br in stride(from: 0, to: 9, by: 3) {
        for bc in stride(from: 0, to: 9, by: 3) {
            var cells = [Character]()
            for r in br..<(br + 3) {
                for c in bc..<(bc + 3) {
                    cells.append(board[r][c])
                }
            }
            if hasDuplicate(cells) { return false }
        }
    }
    return true
}
