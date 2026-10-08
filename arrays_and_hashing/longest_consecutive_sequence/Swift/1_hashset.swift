func longestConsecutive(_ nums: [Int]) -> Int {
    let numSet = Set(nums)
    var longest = 0
    for num in numSet {
        if numSet.contains(num - 1) {
            continue
        }
        var length = 1
        while numSet.contains(num + length) {
            length += 1
        }
        longest = max(longest, length)
    }
    return longest
}
