class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        let n = coins.count
        // memo[i][r] = ways to make r using coins[i...], -1 means not computed yet
        var memo = [[Int]](repeating: [Int](repeating: -1, count: amount + 1), count: n + 1)

        func ways(_ i: Int, _ remaining: Int) -> Int {
            if remaining == 0 { return 1 }
            if i == n { return 0 }
            if memo[i][remaining] != -1 { return memo[i][remaining] }

            var total = ways(i + 1, remaining) // skip coins[i]
            if coins[i] <= remaining {
                total &+= ways(i, remaining - coins[i]) // use coins[i] again
            }
            memo[i][remaining] = total
            return total
        }

        return ways(0, amount)
    }
}
