fun maxSlidingWindow(nums: IntArray, k: Int): IntArray {
    val result = IntArray(nums.size - k + 1)
    for (i in result.indices) {
        var best = nums[i]
        for (j in i + 1 until i + k) {
            if (nums[j] > best) best = nums[j]
        }
        result[i] = best
    }
    return result
}
