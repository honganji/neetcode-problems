class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sChars = Array(s)
        let pChars = Array(p)
        let m = sChars.count
        let n = pChars.count
        // nextRow[j] = does s[i+1:] match p[j:]
        var nextRow = [Bool](repeating: false, count: n + 1)
        for i in stride(from: m, through: 0, by: -1) {
            // cur[j] = does s[i:] match p[j:]
            var cur = [Bool](repeating: false, count: n + 1)
            cur[n] = i == m // empty text matches an empty pattern suffix
            for j in stride(from: n - 1, through: 0, by: -1) {
                let firstMatch = i < m && (pChars[j] == sChars[i] || pChars[j] == ".")
                if j + 1 < n && pChars[j + 1] == "*" {
                    // skip "x*" entirely, or consume one char and stay on "x*"
                    cur[j] = cur[j + 2] || (firstMatch && nextRow[j])
                } else {
                    cur[j] = firstMatch && nextRow[j + 1]
                }
            }
            nextRow = cur
        }
        return nextRow[0]
    }
}
