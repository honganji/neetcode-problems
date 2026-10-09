class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        // best[mask] = max coins from bursting exactly the balloons still set in mask.
        var best = Array(repeating: 0, count: 1 << n)

        for mask in 1..<(1 << n) {
            var total = 0
            for i in 0..<n where ((mask >> i) & 1) == 1 {
                // Neighbors are the nearest balloons still alive on each side (or 1).
                var left = 1
                var j = i - 1
                while j >= 0 {
                    if ((mask >> j) & 1) == 1 {
                        left = nums[j]
                        break
                    }
                    j -= 1
                }
                var right = 1
                j = i + 1
                while j < n {
                    if ((mask >> j) & 1) == 1 {
                        right = nums[j]
                        break
                    }
                    j += 1
                }
                // Burst i now, then solve the rest; the remaining mask is smaller, so already computed.
                let rest = mask ^ (1 << i)
                total = max(total, left * nums[i] * right + best[rest])
            }
            best[mask] = total
        }

        return best[(1 << n) - 1]
    }
}
