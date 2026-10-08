fun longestConsecutive(nums: IntArray): Int {
    if (nums.isEmpty()) return 0
    val sorted = nums.sortedArray()
    var longest = 1
    var length = 1
    for (i in 1 until sorted.size) {
        if (sorted[i] == sorted[i - 1]) continue
        if (sorted[i] == sorted[i - 1] + 1) {
            length++
        } else {
            length = 1
        }
        longest = maxOf(longest, length)
    }
    return longest
}
