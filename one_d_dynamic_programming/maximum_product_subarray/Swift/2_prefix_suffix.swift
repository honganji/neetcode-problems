class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // Scan left-to-right and right-to-left, keeping running products.
        // A zero resets the running product, starting a fresh zero-free block.
        let n = nums.count
        var best = nums[0]
        var prefix = 1
        var suffix = 1
        for i in 0..<n {
            prefix *= nums[i]
            suffix *= nums[n - 1 - i]
            best = max(best, prefix, suffix)
            if prefix == 0 { prefix = 1 }
            if suffix == 0 { suffix = 1 }
        }
        return best
    }
}
