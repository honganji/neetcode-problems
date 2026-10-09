class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // Every path is a sequence of (m - 1) downs and (n - 1) rights.
        // The answer is how many ways we can pick which moves are downs: C(m + n - 2, k).
        let total = m + n - 2
        let k = min(m - 1, n - 1)
        var result = 1
        // stride is used so that k = 0 gives an empty loop instead of a crash.
        for i in stride(from: 1, through: k, by: 1) {
            // Each step keeps result an exact integer, so integer division is safe here.
            result = result * (total - k + i) / i
        }
        return result
    }
}
