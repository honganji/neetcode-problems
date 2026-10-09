class Solution {
    func numDecodings(_ s: String) -> Int {
        let digits = Array(s.utf8)
        let n = digits.count
        // ways[i] = number of ways to decode s[i:].
        // Only the two most recent values are needed, so keep just those.
        var after = 1      // ways[i + 1], starts as ways[n] = 1 (empty suffix)
        var afterNext = 0  // ways[i + 2]

        for i in stride(from: n - 1, through: 0, by: -1) {
            var ways = 0
            if digits[i] != UInt8(ascii: "0") {
                // Decode s[i] as a single letter.
                ways = after
                // Or decode s[i:i+2] as a pair, if it is 10..26.
                if i + 1 < n {
                    let pair = Int(digits[i] - 48) * 10 + Int(digits[i + 1] - 48)
                    if pair >= 10 && pair <= 26 {
                        ways += afterNext
                    }
                }
            }
            afterNext = after
            after = ways
        }

        return after
    }
}
