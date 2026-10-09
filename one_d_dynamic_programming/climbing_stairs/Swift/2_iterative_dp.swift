class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        // ways[i] = ways[i - 1] + ways[i - 2], and only the last two values are needed.
        var prev = 1  // ways to reach step 0
        var curr = 1  // ways to reach step 1
        for _ in 2...n {
            (prev, curr) = (curr, prev + curr)
        }
        return curr
    }
}
