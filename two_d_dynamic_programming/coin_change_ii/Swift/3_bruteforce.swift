class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        func count(_ i: Int, _ remaining: Int) -> Int {
            if remaining < 0 { return 0 }
            if remaining == 0 { return 1 }
            if i == coins.count { return 0 }
            // Either skip coins[i], or use it once and keep considering it.
            return count(i + 1, remaining) &+ count(i, remaining - coins[i])
        }

        return count(0, amount)
    }
}
