class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[String]] = []
        var cols = [Int](repeating: 0, count: n) // cols[row] = column of that row's queen
        let full = (1 << n) - 1

        func backtrack(_ row: Int, _ colMask: Int, _ diag1: Int, _ diag2: Int) {
            if row == n {
                res.append(cols.map { rowString($0, n) })
                return
            }
            // Columns not attacked by any queen placed so far
            var free = full & ~(colMask | diag1 | diag2)
            while free != 0 {
                let bit = free & -free // lowest free column
                free ^= bit
                cols[row] = bit.trailingZeroBitCount
                // Attacked diagonals move one column per row
                backtrack(row + 1, colMask | bit, (diag1 | bit) << 1, (diag2 | bit) >> 1)
            }
        }

        backtrack(0, 0, 0, 0)
        return res
    }

    private func rowString(_ col: Int, _ n: Int) -> String {
        String(repeating: ".", count: col) + "Q" + String(repeating: ".", count: n - col - 1)
    }
}
