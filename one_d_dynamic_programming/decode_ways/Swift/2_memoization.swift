class Solution {
    func numDecodings(_ s: String) -> Int {
        let digits = Array(s.utf8)
        let n = digits.count
        var memo = [Int: Int]()

        // Number of ways to decode s[i:].
        func ways(_ i: Int) -> Int {
            if i == n { return 1 }
            if digits[i] == UInt8(ascii: "0") { return 0 }
            if let cached = memo[i] { return cached }

            // Decode one digit, then optionally decode two digits.
            var result = ways(i + 1)
            if i + 1 < n {
                let pair = Int(digits[i] - 48) * 10 + Int(digits[i + 1] - 48)
                if pair >= 10 && pair <= 26 {
                    result += ways(i + 2)
                }
            }

            memo[i] = result
            return result
        }

        return ways(0)
    }
}
