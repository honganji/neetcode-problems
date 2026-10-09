class Solution {
    func climbStairs(_ n: Int) -> Int {
        var memo: [Int: Int] = [:]

        func ways(_ i: Int) -> Int {
            if i <= 1 { return 1 }
            if let cached = memo[i] { return cached }
            let result = ways(i - 1) + ways(i - 2)
            memo[i] = result
            return result
        }

        return ways(n)
    }
}
