class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        let n = chars.count
        // partitions[i] holds every way to split the first i characters.
        var partitions = Array(repeating: [[String]](), count: n + 1)
        partitions[0] = [[]]

        for end in 1...n {
            for start in 0..<end where isPalindrome(chars, start, end - 1) {
                let last = String(chars[start..<end])
                for prefix in partitions[start] {
                    partitions[end].append(prefix + [last])
                }
            }
        }
        return partitions[n]
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
