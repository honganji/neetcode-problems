func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    let a = Array(s1.utf8)
    let b = Array(s2.utf8)
    let c = Array(s3.utf8)
    let m = a.count
    let n = b.count
    if m + n != c.count { return false }

    // A state (i, j) means s1[:i] and s2[:j] have been used up to s3[:i + j].
    // Start at (0, 0) and move one step at a time to reach (m, n).
    var seen = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: m + 1)
    var queue: [(Int, Int)] = [(0, 0)]
    var head = 0  // index of the next state to process; avoids O(n) removeFirst
    seen[0][0] = true
    while head < queue.count {
        let (i, j) = queue[head]
        head += 1
        if i == m && j == n { return true }
        let k = i + j
        if i < m && a[i] == c[k] && !seen[i + 1][j] {
            seen[i + 1][j] = true
            queue.append((i + 1, j))
        }
        if j < n && b[j] == c[k] && !seen[i][j + 1] {
            seen[i][j + 1] = true
            queue.append((i, j + 1))
        }
    }
    return false
}
