class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        let n = chars.count
        var result: [[String]] = []

        // Bit k of mask set means "cut after index k".
        for mask in 0..<(1 << (n - 1)) {
            var parts: [String] = []
            var start = 0
            var valid = true
            for end in 0..<n {
                let isCut = end == n - 1 || ((mask >> end) & 1) == 1
                if !isCut { continue }
                if !isPalindrome(chars, start, end) {
                    valid = false
                    break
                }
                parts.append(String(chars[start...end]))
                start = end + 1
            }
            if valid { result.append(parts) }
        }
        return result
    }

    private func isPalindrome(_ chars: [Character], _ from: Int, _ to: Int) -> Bool {
        var l = from
        var r = to
        while l < r {
            if chars[l] != chars[r] { return false }
            l += 1
            r -= 1
        }
        return true
    }
}
