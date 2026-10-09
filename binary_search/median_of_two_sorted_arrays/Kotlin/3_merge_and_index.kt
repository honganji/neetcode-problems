fun findMedianSortedArrays(nums1: IntArray, nums2: IntArray): Double {
    val merged = ArrayList<Int>(nums1.size + nums2.size)
    var i = 0
    var j = 0
    while (i < nums1.size && j < nums2.size) {
        if (nums1[i] <= nums2[j]) {
            merged.add(nums1[i])
            i++
        } else {
            merged.add(nums2[j])
            j++
        }
    }
    while (i < nums1.size) {
        merged.add(nums1[i])
        i++
    }
    while (j < nums2.size) {
        merged.add(nums2[j])
        j++
    }
    val total = merged.size
    val mid = total / 2
    if (total % 2 == 1) {
        return merged[mid].toDouble()
    }
    return (merged[mid - 1] + merged[mid]) / 2.0
}
