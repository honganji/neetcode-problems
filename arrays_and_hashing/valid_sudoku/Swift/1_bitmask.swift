func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows = [Int](repeating: 0, count: 9)
    var cols = [Int](repeating: 0, count: 9)
    var boxes = [Int](repeating: 0, count: 9)
    let one = Character("1").asciiValue!
    for r in 0..<9 {
        for c in 0..<9 {
            let ch = board[r][c]
            if ch == "." { continue }
            let bit = 1 << Int(ch.asciiValue! - one)
            let b = (r / 3) * 3 + c / 3
            if rows[r] & bit != 0 || cols[c] & bit != 0 || boxes[b] & bit != 0 {
                return false
            }
            rows[r] |= bit
            cols[c] |= bit
            boxes[b] |= bit
        }
    }
    return true
}
