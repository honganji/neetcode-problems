class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        // Farthest index we can reach so far
        var farthest = 0
        for (i, jump) in nums.enumerated() {
            // Index i is past every reachable index, so it can never be reached
            if i > farthest { return false }
            farthest = max(farthest, i + jump)
        }
        return true
    }
}
