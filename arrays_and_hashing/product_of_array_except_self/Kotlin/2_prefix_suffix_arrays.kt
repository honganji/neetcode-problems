fun productExceptSelf(nums: IntArray): IntArray {
    val n = nums.size
    val prefix = IntArray(n) { 1 }
    val suffix = IntArray(n) { 1 }
    for (i in 1 until n) {
        prefix[i] = prefix[i - 1] * nums[i - 1]
    }
    for (i in n - 2 downTo 0) {
        suffix[i] = suffix[i + 1] * nums[i + 1]
    }
    return IntArray(n) { prefix[it] * suffix[it] }
}
