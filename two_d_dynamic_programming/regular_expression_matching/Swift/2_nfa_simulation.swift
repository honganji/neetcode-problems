class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        let n = pChars.count

        // A "x*" token can be skipped entirely, so jump over it
        func closure(_ active: inout [Bool]) {
            for j in 0..<n where active[j] && j + 1 < n && pChars[j + 1] == "*" {
                active[j + 2] = true
            }
        }

        // State j = "next we must match p[j]"; state n = whole pattern consumed
        var cur = [Bool](repeating: false, count: n + 1)
        cur[0] = true
        closure(&cur)

        for c in sChars {
            var nxt = [Bool](repeating: false, count: n + 1)
            for j in 0..<n where cur[j] && (pChars[j] == c || pChars[j] == ".") {
                if j + 1 < n && pChars[j + 1] == "*" {
                    nxt[j] = true // stay on "x*" to allow more matches
                } else {
                    nxt[j + 1] = true
                }
            }
            closure(&nxt)
            cur = nxt
        }

        return cur[n]
    }
}
