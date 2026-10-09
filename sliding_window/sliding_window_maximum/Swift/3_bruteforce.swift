func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var result = [Int]()
    var i = 0
    while i + k <= nums.count {
        var best = nums[i]
        for j in (i + 1)..<(i + k) {
            if nums[j] > best { best = nums[j] }
        }
        result.append(best)
        i += 1
    }
    return result
}
