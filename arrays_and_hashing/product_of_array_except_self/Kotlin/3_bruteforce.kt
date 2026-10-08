fun productExceptSelf(nums: IntArray): IntArray {
    val n = nums.size
    val result = IntArray(n)
    for (i in 0 until n) {
        var product = 1
        for (j in 0 until n) {
            if (j != i) {
                product *= nums[j]
            }
        }
        result[i] = product
    }
    return result
}
