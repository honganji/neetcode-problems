class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[String]] = []
        var perm = Array(0..<n) // perm[row] = column

        func permute(_ k: Int) {
            if k == n {
                if isValid(perm) {
                    res.append(perm.map { rowString($0, n) })
                }
                return
            }
            for i in k..<n {
                perm.swapAt(k, i)
                permute(k + 1)
                perm.swapAt(k, i)
            }
        }

        permute(0)
        return res
    }

    // Rows and columns are unique by construction, so only diagonals need checking
    private func isValid(_ perm: [Int]) -> Bool {
        let sums = Set(perm.indices.map { $0 + perm[$0] })
        let diffs = Set(perm.indices.map { $0 - perm[$0] })
        return sums.count == perm.count && diffs.count == perm.count
    }

    private func rowString(_ col: Int, _ n: Int) -> String {
        String(repeating: ".", count: col) + "Q" + String(repeating: ".", count: n - col - 1)
    }
}
