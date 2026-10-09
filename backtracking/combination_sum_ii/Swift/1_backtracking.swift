class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let nums = candidates.sorted()
        var result: [[Int]] = []
        var path: [Int] = []

        func backtrack(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(path)
                return
            }
            for i in start..<nums.count {
                // Sorted list: once a number is too big, every later one is too
                if nums[i] > remaining { break }
                // Same value as the previous one at this depth -> same combinations
                if i > start && nums[i] == nums[i - 1] { continue }
                path.append(nums[i])
                backtrack(i + 1, remaining - nums[i])
                path.removeLast()
            }
        }

        backtrack(0, target)
        return result
    }
}
