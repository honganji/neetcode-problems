class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        // dp[i][j] is true when chars[i...j] is a palindrome.
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var start = 0, best = 0

        // Going i from right to left means dp[i + 1][...] is ready when needed.
        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in i..<n {
                // chars[i...j] is a palindrome if its ends match and the inside is one too.
                if chars[i] == chars[j] && (j - i < 2 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                    if j - i + 1 > best {
                        start = i
                        best = j - i + 1
                    }
                }
            }
        }
        return String(chars[start..<(start + best)])
    }
}
