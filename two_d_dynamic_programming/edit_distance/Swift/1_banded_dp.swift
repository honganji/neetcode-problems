class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let a = Array(word1.utf8)
        let b = Array(word2.utf8)
        // Try a band of width k around the diagonal; double k until the answer fits.
        var k = max(1, abs(a.count - b.count))
        while true {
            let result = banded(a, b, k)
            if result <= k { return result }
            k *= 2
        }
    }

    private func banded(_ a: [UInt8], _ b: [UInt8], _ k: Int) -> Int {
        let m = a.count
        let n = b.count
        let inf = m + n + 1  // larger than any real cost
        var prev = (0...n).map { $0 <= k ? $0 : inf }
        for i in stride(from: 1, through: m, by: 1) {
            var cur = [Int](repeating: inf, count: n + 1)
            if i <= k { cur[0] = i }
            // Only fill cells within k of the diagonal.
            let lo = max(1, i - k)
            let hi = min(n, i + k)
            for j in stride(from: lo, through: hi, by: 1) {
                if a[i - 1] == b[j - 1] {
                    cur[j] = prev[j - 1]
                } else {
                    cur[j] = 1 + min(prev[j - 1], prev[j], cur[j - 1])
                }
            }
            prev = cur
        }
        return prev[n]
    }
}
