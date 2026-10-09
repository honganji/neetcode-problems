class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 { return nums[0] }

        var best = 0
        // Each bit of mask says whether that house is robbed (2^n possible sets).
        for mask in 0..<(1 << n) {
            var legal = true
            var total = 0
            for i in 0..<n {
                let robbed = ((mask >> i) & 1) == 1
                let nextRobbed = ((mask >> ((i + 1) % n)) & 1) == 1
                // Two neighbours on the circle can't both be robbed.
                if robbed && nextRobbed {
                    legal = false
                    break
                }
                if robbed { total += nums[i] }
            }
            if legal { best = max(best, total) }
        }
        return best
    }
}
