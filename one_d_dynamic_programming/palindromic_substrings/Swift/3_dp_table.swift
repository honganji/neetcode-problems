class Solution {
    func countSubstrings(_ s: String) -> Int {
        let c = Array(s.utf8)
        let n = c.count
        // dp[i][j] is true when c[i...j] is a palindrome.
        var dp = Array(repeating: Array(repeating: false, count: n), count: n)
        var count = 0
        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in i..<n {
                // Ends must match, and the inside must itself be a palindrome (or empty/one char).
                if c[i] == c[j] && (j - i < 2 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                    count += 1
                }
            }
        }
        return count
    }
}
