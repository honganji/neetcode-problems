class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0, +)
        if total % 2 != 0 { return false }

        func dfs(_ i: Int, _ remaining: Int) -> Bool {
            // Found a subset with the exact target sum.
            if remaining == 0 { return true }
            // Ran out of numbers, or overshot the target.
            if i == nums.count || remaining < 0 { return false }
            // Try taking nums[i], or skipping it.
            return dfs(i + 1, remaining - nums[i]) || dfs(i + 1, remaining)
        }

        return dfs(0, total / 2)
    }
}
