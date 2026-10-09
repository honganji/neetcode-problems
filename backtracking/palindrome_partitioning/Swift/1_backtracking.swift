class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        let n = chars.count
        // isPal[i][j] is true when chars[i...j] is a palindrome.
        var isPal = Array(repeating: Array(repeating: false, count: n), count: n)
        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in i..<n {
                isPal[i][j] = chars[i] == chars[j] && (j - i < 2 || isPal[i + 1][j - 1])
            }
        }

        var result: [[String]] = []
        var current: [String] = []

        func backtrack(_ start: Int) {
            if start == n {
                result.append(current)
                return
            }
            for end in start..<n where isPal[start][end] {
                current.append(String(chars[start...end]))
                backtrack(end + 1)
                current.removeLast()
            }
        }

        backtrack(0)
        return result
    }
}
