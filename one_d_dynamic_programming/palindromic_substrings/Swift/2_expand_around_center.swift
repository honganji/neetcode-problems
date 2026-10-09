class Solution {
    func countSubstrings(_ s: String) -> Int {
        let c = Array(s.utf8)
        let n = c.count
        var count = 0
        // There are 2n - 1 possible centers: n characters and n - 1 gaps between them.
        for center in 0..<(2 * n - 1) {
            var left = center / 2
            var right = left + center % 2
            // Every time the ends still match, the substring between them is a new palindrome.
            while left >= 0 && right < n && c[left] == c[right] {
                count += 1
                left -= 1
                right += 1
            }
        }
        return count
    }
}
