func longestConsecutive(_ nums: [Int]) -> Int {
    var longest = 0
    for num in nums {
        var length = 1
        while nums.contains(num + length) {
            length += 1
        }
        longest = max(longest, length)
    }
    return longest
}
