func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    func backtrack(_ i: Int, _ current: Int) -> Int {
        if i == nums.count { return current == target ? 1 : 0 }
        // give nums[i] a "+" sign, then a "-" sign
        return backtrack(i + 1, current + nums[i]) + backtrack(i + 1, current - nums[i])
    }

    return backtrack(0, 0)
}
