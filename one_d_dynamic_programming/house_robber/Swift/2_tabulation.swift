class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        // dp[i] = best total using the first i houses
        var dp = Array(repeating: 0, count: n + 1)
        for i in 0..<n {
            // house i is nums[i]; the houses before it end at dp[i - 1]
            let take = nums[i] + (i >= 1 ? dp[i - 1] : 0)
            dp[i + 1] = max(dp[i], take)
        }
        return dp[n]
    }
}
