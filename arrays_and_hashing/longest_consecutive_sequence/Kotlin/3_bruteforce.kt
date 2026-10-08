fun longestConsecutive(nums: IntArray): Int {
    var longest = 0
    for (num in nums) {
        var length = 1
        while (nums.contains(num + length)) {
            length++
        }
        longest = maxOf(longest, length)
    }
    return longest
}
