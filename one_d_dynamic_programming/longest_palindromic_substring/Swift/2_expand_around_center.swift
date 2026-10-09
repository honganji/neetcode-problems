class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var start = 0, best = 0

        for center in 0..<n {
            // Odd-length palindromes center on a character, even-length on a gap.
            for offset in 0...1 {
                var left = center, right = center + offset
                while left >= 0 && right < n && chars[left] == chars[right] {
                    left -= 1
                    right += 1
                }
                // chars[left + 1 ..< right] is the palindrome found from this center.
                let length = right - left - 1
                if length > best {
                    best = length
                    start = left + 1
                }
            }
        }
        return String(chars[start..<(start + best)])
    }
}
