class Solution {
    func numDecodings(_ s: String) -> Int {
        let digits = Array(s.utf8)
        let n = digits.count

        // Try every possible split of s[i:] into 1-digit and 2-digit pieces.
        func ways(_ i: Int) -> Int {
            if i == n { return 1 }
            if digits[i] == UInt8(ascii: "0") { return 0 }

            var total = ways(i + 1)
            if i + 1 < n {
                let pair = Int(digits[i] - 48) * 10 + Int(digits[i + 1] - 48)
                if pair >= 10 && pair <= 26 {
                    total += ways(i + 2)
                }
            }
            return total
        }

        return ways(0)
    }
}
