class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // Try every subarray by fixing a start and extending the end.
        var best = nums[0]
        for i in nums.indices {
            var product = 1
            for j in i..<nums.count {
                product *= nums[j]
                best = max(best, product)
            }
        }
        return best
    }
}
