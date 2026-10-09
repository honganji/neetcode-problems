fun findDuplicate(nums: IntArray): Int {
    var low = 1
    var high = nums.size - 1
    while (low < high) {
        val mid = (low + high) / 2
        val count = nums.count { it <= mid }
        if (count > mid) {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
