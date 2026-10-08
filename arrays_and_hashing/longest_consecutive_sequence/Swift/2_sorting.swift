func longestConsecutive(_ nums: [Int]) -> Int {
    if nums.isEmpty {
        return 0
    }
    let sorted = nums.sorted()
    var longest = 1
    var length = 1
    for i in 1..<sorted.count {
        if sorted[i] == sorted[i - 1] {
            continue
        }
        if sorted[i] == sorted[i - 1] + 1 {
            length += 1
        } else {
            length = 1
        }
        longest = max(longest, length)
    }
    return longest
}
