class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        // dp[i] = length of the longest increasing subsequence ending at nums[i].
        var dp = [Int](repeating: 1, count: n)

        var best = 0
        for i in 0..<n {
            for j in 0..<i where nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
            best = max(best, dp[i])
        }
        return best
    }
}
