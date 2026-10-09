class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0, +)
        if total % 2 != 0 { return false }
        let target = total / 2

        // dp[s] is true when some subset adds up to exactly s.
        var dp = [Bool](repeating: false, count: target + 1)
        dp[0] = true
        for num in nums {
            // Go backwards so each number is used at most once.
            for s in stride(from: target, through: num, by: -1) {
                dp[s] = dp[s] || dp[s - num]
            }
        }

        return dp[target]
    }
}
