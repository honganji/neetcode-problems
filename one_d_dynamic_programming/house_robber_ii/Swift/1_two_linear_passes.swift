class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 { return nums[0] }
        // Breaking the circle at either end leaves a straight line of houses.
        return max(robRange(nums, 0, n - 2), robRange(nums, 1, n - 1))
    }

    private func robRange(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        // Classic "House Robber" on a straight line, using two rolling values.
        var prev2 = 0 // best total up to two houses back
        var prev1 = 0 // best total up to one house back
        for i in start...end {
            let current = max(prev1, prev2 + nums[i])
            prev2 = prev1
            prev1 = current
        }
        return prev1
    }
}
