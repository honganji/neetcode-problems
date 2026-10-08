fun containsDuplicate(nums: IntArray): Boolean {
    val sorted = nums.sortedArray()
    for (i in 1 until sorted.size) {
        if (sorted[i] == sorted[i - 1]) {
            return true
        }
    }
    return false
}
