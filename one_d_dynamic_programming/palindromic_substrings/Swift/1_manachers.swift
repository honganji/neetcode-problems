class Solution {
    func countSubstrings(_ s: String) -> Int {
        let c = Array(s.utf8)
        let n = c.count

        // d1[i]: how many odd-length palindromes are centered at c[i].
        var d1 = Array(repeating: 0, count: n)
        var l = 0
        var r = -1 // rightmost palindrome found so far is c[l...r]
        for i in 0..<n {
            // Reuse the mirror image inside the known palindrome when possible.
            var k = i > r ? 1 : min(d1[l + r - i], r - i + 1)
            while i - k >= 0 && i + k < n && c[i - k] == c[i + k] {
                k += 1
            }
            d1[i] = k
            if i + k - 1 > r {
                l = i - k + 1
                r = i + k - 1
            }
        }

        // d2[i]: how many even-length palindromes sit between c[i-1] and c[i].
        var d2 = Array(repeating: 0, count: n)
        l = 0
        r = -1
        for i in 0..<n {
            var k = i > r ? 0 : min(d2[l + r - i + 1], r - i + 1)
            while i - k - 1 >= 0 && i + k < n && c[i - k - 1] == c[i + k] {
                k += 1
            }
            d2[i] = k
            if i + k - 1 > r {
                l = i - k
                r = i + k - 1
            }
        }

        return d1.reduce(0, +) + d2.reduce(0, +)
    }
}
