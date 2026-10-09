class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // A negative number can turn the smallest product so far into the largest,
        // so track both the max and min product of subarrays ending at each index.
        var curMax = nums[0]
        var curMin = nums[0]
        var best = nums[0]
        for x in nums.dropFirst() {
            let a = curMax * x
            let b = curMin * x
            curMax = max(x, a, b)
            curMin = min(x, a, b)
            best = max(best, curMax)
        }
        return best
    }
}
