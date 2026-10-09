fun findMedianSortedArrays(nums1: IntArray, nums2: IntArray): Double {
    var a = nums1
    var b = nums2
    if (a.size > b.size) {
        a = nums2
        b = nums1
    }
    val m = a.size
    val n = b.size
    val half = (m + n + 1) / 2
    var low = 0
    var high = m
    while (low <= high) {
        val i = (low + high) / 2
        val j = half - i
        val maxLeftA = if (i > 0) a[i - 1] else Int.MIN_VALUE
        val minRightA = if (i < m) a[i] else Int.MAX_VALUE
        val maxLeftB = if (j > 0) b[j - 1] else Int.MIN_VALUE
        val minRightB = if (j < n) b[j] else Int.MAX_VALUE
        if (maxLeftA <= minRightB && maxLeftB <= minRightA) {
            val maxLeft = maxOf(maxLeftA, maxLeftB)
            if ((m + n) % 2 == 1) {
                return maxLeft.toDouble()
            }
            val minRight = minOf(minRightA, minRightB)
            return (maxLeft + minRight) / 2.0
        }
        if (maxLeftA > minRightB) {
            high = i - 1
        } else {
            low = i + 1
        }
    }
    return 0.0
}
