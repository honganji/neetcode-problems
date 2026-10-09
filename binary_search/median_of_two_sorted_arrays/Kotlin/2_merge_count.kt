fun findMedianSortedArrays(nums1: IntArray, nums2: IntArray): Double {
    val total = nums1.size + nums2.size
    var i = 0
    var j = 0
    var prev = 0
    var curr = 0
    repeat(total / 2 + 1) {
        prev = curr
        if (j >= nums2.size || (i < nums1.size && nums1[i] <= nums2[j])) {
            curr = nums1[i]
            i++
        } else {
            curr = nums2[j]
            j++
        }
    }
    if (total % 2 == 1) {
        return curr.toDouble()
    }
    return (prev + curr) / 2.0
}
