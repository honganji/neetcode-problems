func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    let a = Array(s1.utf8)
    let b = Array(s2.utf8)
    let c = Array(s3.utf8)
    let m = a.count
    let n = b.count
    if m + n != c.count { return false }

    // memo[i][j] is nil until that state has been computed.
    var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: n + 1), count: m + 1)

    func dfs(_ i: Int, _ j: Int) -> Bool {
        // Used all of s1 and s2, so s3 is fully matched.
        if i == m && j == n { return true }
        if let cached = memo[i][j] { return cached }
        let k = i + j
        // Try to take the next character from s1, or from s2.
        let result = (i < m && a[i] == c[k] && dfs(i + 1, j))
            || (j < n && b[j] == c[k] && dfs(i, j + 1))
        memo[i][j] = result
        return result
    }

    return dfs(0, 0)
}
