class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        // Leftmost index known to reach the last index (the last index is the goal)
        var lastGood = nums.count - 1
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            // From i we can land on any index up to i + nums[i]
            if i + nums[i] >= lastGood {
                lastGood = i
            }
        }
        return lastGood == 0
    }
}
