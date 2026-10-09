class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[String]] = []
        var cols = [Int](repeating: 0, count: n) // cols[row] = column of that row's queen

        func place(_ row: Int) {
            if row == n {
                if isValid(cols) {
                    res.append(cols.map { rowString($0, n) })
                }
                return
            }
            // Try every column for this row
            for c in 0..<n {
                cols[row] = c
                place(row + 1)
            }
        }

        place(0)
        return res
    }

    private func isValid(_ cols: [Int]) -> Bool {
        for i in 0..<cols.count {
            for j in (i + 1)..<cols.count {
                // Same column, or same diagonal (equal row and column distance)
                if cols[i] == cols[j] || abs(cols[i] - cols[j]) == j - i {
                    return false
                }
            }
        }
        return true
    }

    private func rowString(_ col: Int, _ n: Int) -> String {
        String(repeating: ".", count: col) + "Q" + String(repeating: ".", count: n - col - 1)
    }
}
