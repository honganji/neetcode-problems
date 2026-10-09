class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // row[j] = number of paths to the cell at column j of the current row.
        var row = Array(repeating: 1, count: n)  // the first row: one way to each cell
        for _ in 1..<m {
            for j in 1..<n {
                // row[j] holds the count from above; row[j - 1] was already updated
                // for this row, so it holds the count from the left.
                row[j] += row[j - 1]
            }
        }
        return row[n - 1]
    }
}
