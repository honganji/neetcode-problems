fun longestConsecutive(nums: IntArray): Int {
    val numSet = nums.toHashSet()
    var longest = 0
    for (num in numSet) {
        if (numSet.contains(num - 1)) continue
        var length = 1
        while (numSet.contains(num + length)) {
            length++
        }
        longest = maxOf(longest, length)
    }
    return longest
}
