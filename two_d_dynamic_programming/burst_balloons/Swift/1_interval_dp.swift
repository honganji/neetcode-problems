class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        // Pad with 1s so edge balloons have a neighbor on each side.
        let arr = [1] + nums + [1]
        // dp[l][r] = max coins from bursting every balloon in arr[l...r],
        // with arr[l-1] and arr[r+1] left alive as the boundaries.
        var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 2)

        for length in stride(from: 1, through: n, by: 1) {
            for l in 1...(n - length + 1) {
                let r = l + length - 1
                var best = 0
                // k is the last balloon burst in [l, r]; its neighbors are the boundaries.
                for k in l...r {
                    let coins = arr[l - 1] * arr[k] * arr[r + 1]
                    best = max(best, dp[l][k - 1] + coins + dp[k + 1][r])
                }
                dp[l][r] = best
            }
        }

        return dp[1][n]
    }
}
