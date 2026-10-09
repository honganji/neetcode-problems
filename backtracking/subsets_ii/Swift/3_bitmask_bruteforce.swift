func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let n = nums.count
    var seen = Set<[Int]>()
    var result: [[Int]] = []

    // Every bit pattern is one candidate subset.
    for mask in 0..<(1 << n) {
        var subset: [Int] = []
        for i in 0..<n where (mask & (1 << i)) != 0 {
            subset.append(nums[i])
        }
        // Sorting makes [1, 2] and [2, 1] the same key.
        subset.sort()
        if seen.insert(subset).inserted {
            result.append(subset)
        }
    }
    return result
}
