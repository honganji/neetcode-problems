class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)

        // Interleave "#" so every palindrome has odd length ("aba" -> "#a#b#a#").
        var t: [Character] = ["#"]
        for ch in chars {
            t.append(ch)
            t.append("#")
        }
        let n = t.count

        // p[i]: radius of the palindrome centered at t[i] (in t, not in s).
        var p = [Int](repeating: 0, count: n)
        var center = 0, right = 0  // the palindrome reaching furthest right so far
        var bestCenter = 0
        for i in 0..<n {
            if i < right {
                // Start from the mirror image's radius, capped at the known box.
                p[i] = min(right - i, p[2 * center - i])
            }
            while i - p[i] - 1 >= 0 && i + p[i] + 1 < n && t[i - p[i] - 1] == t[i + p[i] + 1] {
                p[i] += 1
            }
            if i + p[i] > right {
                center = i
                right = i + p[i]
            }
            if p[i] > p[bestCenter] {
                bestCenter = i
            }
        }

        let start = (bestCenter - p[bestCenter]) / 2
        return String(chars[start..<(start + p[bestCenter])])
    }
}
