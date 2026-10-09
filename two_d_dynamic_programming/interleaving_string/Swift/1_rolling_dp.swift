func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    let a = Array(s1.utf8)
    let b = Array(s2.utf8)
    let c = Array(s3.utf8)
    let m = a.count
    let n = b.count
    if m + n != c.count { return false }

    // dp[j] is true when s1[:i] and s2[:j] can interleave into s3[:i + j].
    // One row is reused: dp[j] still holds row i - 1 until it is updated.
    var dp = [Bool](repeating: false, count: n + 1)
    for i in 0...m {
        for j in 0...n {
            if i == 0 && j == 0 {
                dp[j] = true
                continue
            }
            let fromTop = i > 0 && dp[j] && a[i - 1] == c[i + j - 1]
            let fromLeft = j > 0 && dp[j - 1] && b[j - 1] == c[i + j - 1]
            dp[j] = fromTop || fromLeft
        }
    }
    return dp[n]
}
