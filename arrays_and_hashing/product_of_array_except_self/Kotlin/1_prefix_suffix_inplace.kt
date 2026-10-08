fun productExceptSelf(nums: IntArray): IntArray {
    val n = nums.size
    val result = IntArray(n) { 1 }
    for (i in 1 until n) {
        result[i] = result[i - 1] * nums[i - 1]
    }
    var suffix = 1
    for (i in n - 1 downTo 0) {
        result[i] *= suffix
        suffix *= nums[i]
    }
    return result
}
