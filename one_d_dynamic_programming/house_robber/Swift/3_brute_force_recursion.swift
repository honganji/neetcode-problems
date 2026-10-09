class Solution {
    func rob(_ nums: [Int]) -> Int {
        // best total for houses i onward, recomputed on every call
        func tryFrom(_ i: Int) -> Int {
            if i >= nums.count { return 0 }
            let skip = tryFrom(i + 1)
            let take = nums[i] + tryFrom(i + 2)
            return max(skip, take)
        }
        return tryFrom(0)
    }
}
