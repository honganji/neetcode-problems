func subsets(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    var result: [[Int]] = []
    // Each mask from 0 to 2^n - 1 is a yes/no pattern: bit i set means nums[i] is included.
    for mask in 0..<(1 << n) {
        var subset: [Int] = []
        for i in 0..<n where (mask & (1 << i)) != 0 {
            subset.append(nums[i])
        }
        result.append(subset)
    }
    return result
}
