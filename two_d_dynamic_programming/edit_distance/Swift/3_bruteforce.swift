class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let a = Array(word1.utf8)
        let b = Array(word2.utf8)
        let m = a.count
        let n = b.count

        // a[i...] and b[j...] are the parts still to match
        func solve(_ i: Int, _ j: Int) -> Int {
            if i == m { return n - j }  // insert the rest of word2
            if j == n { return m - i }  // delete the rest of word1
            if a[i] == b[j] { return solve(i + 1, j + 1) }
            return 1 + min(
                solve(i + 1, j + 1),  // replace
                solve(i + 1, j),      // delete
                solve(i, j + 1)       // insert
            )
        }

        return solve(0, 0)
    }
}
