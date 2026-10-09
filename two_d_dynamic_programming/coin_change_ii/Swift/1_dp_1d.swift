class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1 // one way to make 0: use no coins

        for coin in coins {
            // Counting upward lets a coin be reused as many times as needed.
            for a in stride(from: coin, through: amount, by: 1) {
                dp[a] &+= dp[a - coin] // wrapping add; the final answer fits in 32 bits
            }
        }
        return dp[amount]
    }
}
