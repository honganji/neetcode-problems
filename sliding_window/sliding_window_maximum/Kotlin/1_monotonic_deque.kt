fun maxSlidingWindow(nums: IntArray, k: Int): IntArray {
    val result = IntArray(nums.size - k + 1)
    val window = ArrayDeque<Int>()
    for (i in nums.indices) {
        while (window.isNotEmpty() && nums[window.last()] <= nums[i]) {
            window.removeLast()
        }
        window.addLast(i)
        if (window.first() <= i - k) {
            window.removeFirst()
        }
        if (i >= k - 1) {
            result[i - k + 1] = nums[window.first()]
        }
    }
    return result
}
